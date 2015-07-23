h1. Pretty Fail Formatter

TODO: insert useful description

h2. Installation

Put it in your @Gemfile@

bc. gem 'cucumber-pretty_fail_formatter'

run @bundle install@

If you don't user Bundler you can install it using the @gem@ command:

bc. $ gem install cucumber-pretty_fail_formatter

You can now run your features like this:

bc. $ cucumber --format pretty-fail

If you want to use it as your default formatter, simply put the option in your @cucumber.yml@ file:

bc. --format pretty-fail

h2. Contributing

 * Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
 * Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
 * Fork the project
 * Start a feature/bugfix branch
 * Commit and push until you are happy with your contribution
 * Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
 * Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

h2. Copyright

Copyright (c) 2015 Philipp Tessenow. This project is MIT licensed, see LICENSE.md for details.

