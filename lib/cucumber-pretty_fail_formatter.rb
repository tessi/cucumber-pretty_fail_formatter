require 'cucumber/formatter/pretty_fail'

# Extend Cucumber's builtin formats, so that this
# formatter can be used with --format pretty-fail
require 'cucumber/cli/main'

Cucumber::Cli::Options::BUILTIN_FORMATS["pretty-fail"] = [
  "Cucumber::Formatter::PrettyFail",
  "A cucumber formatter which is concise on success and pretty on failures"
]
