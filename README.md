# Pretty Fail Formatter

A cucumber formatter which is concise on success and pretty on failures. It behaves like the standard `progress` formatter, printing only nice green dots.
Except when a cuke failes, then it prints the failing cuke verbosely, so that you instantly see what's wrong.

    bundle exec cucumber --format pretty-fail
    .....F
    Feature: An Admin does something wrong

      Scenario: Admin does something wrong                # features/admin.feature:4
        Given I want to view something as an admin        # features/step_definitions/admin_steps.rb:1
        When I am on the admin dashboard page             # features/step_definitions/navigational_steps.rb:1
        Then I should see something, which does not exist # features/step_definitions/admin_steps.rb:2
          Expected something to exist
          ./features/step_definitions/admin_steps.rb:7:in `/^I should see (.*)$/'
          features/admin.feature:10:in `Then I should see something, which does not exist'

    ..........

    Failing Scenarios:
    cucumber features/admin.feature:4 # Scenario: Admin does something wrong

    3 scenarios (1 failed, 2 passed)
    16 steps (1 failed, 15 passed)
    0m10.307s


## Installation

Put it in your `Gemfile`

    gem 'cucumber-pretty_fail_formatter'

Run `bundle install`

If you don't user Bundler you can install it using the `gem` command:

    $ gem install cucumber-pretty_fail_formatter

You can now run your features like this:

    $ cucumber --format pretty-fail

If you want to use it as your default formatter, simply put the option in your `cucumber.yml` file:

    --format pretty-fail

## Contributing

 * Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
 * Check out the github issues to make sure someone already hasn't requested it and/or contributed it
 * Fork the project
 * Start a feature/bugfix branch
 * Commit and push until you are happy with your contribution

## Copyright

Copyright (c) 2015 Philipp Tessenow. This project is MIT licensed, see LICENSE.md for details.

