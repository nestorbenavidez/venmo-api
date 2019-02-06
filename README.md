Development Process
----------------------------------------------------------------
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

5. Create model Transaction
   rails g model Transaction description user_to:references user_from:references amount:decimal

6. Adding friendship to Users
   For this tasks I relied on the following gem 'has_friendship' ->  https://github.com/sungwoncho/has_friendship
   added it to Gemfile and using friends_with?, friend_request and accept_request;
   Also run migration for engines been used by the gem

7. Create seed data on seed.rb
   For testing porpuses I'll create 5 users Natalia friend with Nestor and Maya, Ana friend with Miriam   
   (Test Relationships via rails console)

8. Create methods payment, balance, feed inside UsersController

9. Create method payment with validations inside User model

10. Testing first json responses with httpie
    sample:


    nestor@ubuntu-nestor:~/Documents/venmo-api$ http :3000/users

HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8
ETag: W/"4d267c081b7712df701eaee0f0f56278"
Transfer-Encoding: chunked
X-Request-Id: bb6a3790-6135-45a8-b637-06b954d42445
X-Runtime: 0.027652

[
    {
        "balance": "100.0",
        "created_at": "2019-02-06T12:52:24.297Z",
        "email": "natalia@venmo.com",
        "id": 1,
        "name": "Natalia",
        "updated_at": "2019-02-06T12:52:24.297Z"
    },
    {
        "balance": "100.0",
        "created_at": "2019-02-06T12:52:25.283Z",
        "email": "nestor@venmo.com",
        "id": 2,
        "name": "Nestor",
        "updated_at": "2019-02-06T12:52:25.283Z"
    },
    {
        "balance": "100.0",
        "created_at": "2019-02-06T12:52:25.385Z",
        "email": "maya@venmo.com",
        "id": 3,
        "name": "Maya",
        "updated_at": "2019-02-06T12:52:25.385Z"
    },
    {
        "balance": "100.0",
        "created_at": "2019-02-06T12:52:25.496Z",
        "email": "ana@venmo.com",
        "id": 4,
        "name": "Ana",
        "updated_at": "2019-02-06T12:52:25.496Z"
    },
    {
        "balance": "100.0",
        "created_at": "2019-02-06T12:52:25.607Z",
        "email": "miriam@venmo.com",
        "id": 5,
        "name": "Miriam",
        "updated_at": "2019-02-06T12:52:25.607Z"
    }
]

11. 
