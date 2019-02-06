# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#for testing porpuses I'll create 5 users Natalia friends with Nestor and Maya
# Ana friends with Miriam

user1 = User.create(name: 'Natalia', email:'natalia@venmo.com',balance: 100.00)
user2 = User.create(name: 'Nestor', email:'nestor@venmo.com',balance: 100.00)
user3 = User.create(name: 'Maya', email:'maya@venmo.com',balance: 100.00)
user4 = User.create(name: 'Ana', email:'ana@venmo.com',balance: 100.00)
user5 = User.create(name: 'Miriam', email:'miriam@venmo.com',balance: 100.00)

user1.friend_request(user2)
user1.friend_request(user3)
user4.friend_request(user5)
user2.accept_request(user1)
user3.accept_request(user1)
user5.accept_request(user4)
