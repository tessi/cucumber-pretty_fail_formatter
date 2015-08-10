require 'cucumber'

require 'cucumber/formatter/pretty'
require 'cucumber/formatter/progress'


##
# The strategy of this formatter is to take the pretty formatter and let it write into a fake-io.
# Then do whatever the progress formatter does. but, in case of an error, print the prettyfied error from the fake-io.
module Cucumber
  module Formatter
    # The formatter used for <tt>--format pretty-fail</tt>
    class PrettyFail < Cucumber::Formatter::Pretty
      def initialize(runtime, path_or_io, options)
        @runtime, @output, @options = runtime, ensure_io(path_or_io, "pretty-fail"), options
        @io = StringIO.new # the fake io for the pretty formatter we inherit from
        @snippets_input = []
        @previous_step_keyword = nil

        @exceptions = []
        @indent = 0
        @prefixes = options[:prefixes] || {}
        @delayed_messages = []
      end

      def after_features(features)
        @output.puts
        @output.puts
        print_summary(features)
      end

      def before_feature_element(*args)
        super
        @exception_raised = false
      end

      def after_feature_element(*args)
        super
        progress(:failed) if (defined? @exception_raised) and (@exception_raised)
        @exception_raised = false
      end

      def before_steps(*args)
        progress(:failed) if (defined? @exception_raised) and (@exception_raised)
        @exception_raised = false
      end

      def after_steps(*args)
        @exception_raised = false
      end

      def after_step_result(keyword, step_match, multiline_arg, status, exception, source_indent, background, file_colon_line)
        progress(status)
        @status = status
      end

      def before_outline_table(outline_table)
        super
        @outline_table = outline_table
      end

      def after_outline_table(outline_table)
        super
        @outline_table = nil
      end

      def table_cell_value(value, status)
        super
        return unless @outline_table
        status ||= @status
        progress(status) unless table_header_cell?(status)
      end

      def exception(*args)
        super
        @exception_raised = true
      end

      private

      def print_summary(features)
        reset_io
        print_steps(:pending)
        print_steps(:failed)
        print_stats(features, @options)
        print_snippets(@options)
        print_passing_wip(@options)
        @output.print(@io.string)
        @output.flush
      end

      CHARS = {
        :passed    => '.',
        :failed    => 'F',
        :undefined => 'U',
        :pending   => 'P',
        :skipped   => '-'
      }

      def progress(status)
        char = CHARS[status]
        @output.print(format_string(char, status))
        if %i(failed undefined).include?(status)
          @output.puts
          @output.print(@io.string)
          @output.puts
        end
        reset_io
        @output.flush
      end

      def table_header_cell?(status)
        status == :skipped_param
      end

      def reset_io
        @io.string = ''
      end

    end
  end
end
