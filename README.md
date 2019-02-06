# README

#Development Process
----------------------------------------------------------------
1. Build api based project excluding minitest (we're using rspec)

   nestor@ubuntu-nestor:~/Documents$ rails new venmo-api --api -T

2. Dependencies

   rails-erd - Entity Relationships Diagram in Development  (to build pdf in root, just run "bundle exec erd", for this test It'll be already added to the project)
   rspec-rails - Testing framework
   factory_bot_rails - A fixtures replacement with a more straightforward syntax. You'll see.
   shoulda_matchers - Provides RSpec with additional matchers.
   database_cleaner - You guessed it! It literally cleans our test database to ensure a clean state in each test suite.
   faker - A library for generating fake data. We'll use this to generate test data.

in Gemfile, then bundle install.

3. Install rspec
   rails generate rspec:install

4. Create scaffold User
   nestor@ubuntu-nestor:~/Documents/venmo-api$ rails g scaffold User name email balance

5.
