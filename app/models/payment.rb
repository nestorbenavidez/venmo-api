class Payment < ApplicationRecord
  MIN_AMOUNT = 0
  MAX_AMOUNT = 1000

  validate :amount_limits
  paginates_per 10

@mac.friends_with?(@dee)

  def self.transfer_amount(user_id, friend_id, amount, description = "NA")
    ok_transaction = false
    if User.find(user_id).friends_with?(User.find(friend_id))
      ActiveRecord::Base.transaction do
        recalculate_balance(user_id, friend_id, amount)
        Payment.create(user_to: friend_id, user_from: user_id, amount: amount, description: description)
        ok_transaction = true
      end
    end
    ok_transaction
  end

   def self.recalculate_balance(user_id, friend_id, amount)
     sender = User.find(user_id)
     friend = User.find(friend_id)
     sender.balance = sender.balance.to_f - amount.to_f
     friend.balance = friend.balance.to_f + amount.to_f
     friend.save!
     sender.save!
   end

   def self.feed(user_id)
     feed_items = Array.new
     Payment.all.each do |item|
       if item.user_from == user_id || item.user_to == user_id
         feed_items.unshift(User.find(item.user_from).name + " paid " + User.find(item.user_to).name + " on " + item.created_at.to_s)
       end
     end
     feed_items.to_json
   end

   private

   def amount_limits
     if volume > MAX_AMOUNT
       errors.add(:volume, "cannot be above 1000 USD")
     elsif volume < MIN_AMOUNT
       errors.add(:volume, "cannot be below 0 USD")
     end
   end


end
