##Installation
--------------------------------------------------------------------------------

1. Clone this repository
2. Bundle install
3. Prepare data rake db:create && rake db:migrate && rake db:seed
4. Run over Webrick   
   rails s
--------------------------------------------------------------------------------
(https://github.com/nestorbenavidez/venmo-api/blob/master/erd.pdf)

##Development Process
--------------------------------------------------------------------------------
1. Build api based project excluding minitest (we're using rspec)
   rails new venmo-api --api -T

2. Dependencies
   rails-erd - Entity Relationships Diagram in Development  (to build pdf in root, just run "bundle exec erd", for this test It'll be already added to the project)
   rspec-rails - Testing framework
   factory_bot_rails - A fixtures replacement with a more straightforward syntax. You'll see.
   shoulda_matchers - Provides RSpec with additional matchers.
   database_cleaner - You guessed it! It literally cleans our test database to ensure a clean state in each test suite.
   faker - A library for generating fake data. We'll use this to generate test data

in Gemfile, then bundle install

3. Install rspec
   rails generate rspec:install

4. Create scaffold User
   rails g scaffold User name email balance:decimal

5. Create model Payment
   rails g model Payment description user_to:references user_from:references amount:decimal

6. Adding friendship to Users
   For this tasks I relied on the following gem 'has_friendship' ->  https://github.com/sungwoncho/has_friendship
   added it to Gemfile and using friends_with?, friend_request and accept_request;
   Also run migration for engines been used by the gem

7. Create seed data on seed.rb
   For testing porpuses I'll create 5 users Natalia friend with Nestor and Maya, Ana friend with Miriam   
   (Test Relationships via rails console)

8. Create methods payment, balance, feed inside UsersController

9. Create method payment with validations inside Payment model

10. Testing first json responses with httpie

11. Using pagination gem Kaminari, setup and install into Payment

12. Add validations

note: there are some functionalities that I didn't include for lack of time on my part, I did have some issues the first day and play catch the second day, these include:
 * Some testing specs
 * Enable the MoneyTransferService
 * Add friend items to feed (when is not related to the current user)
 * integrate the Account Model (the model was created with reference to user and balance)
