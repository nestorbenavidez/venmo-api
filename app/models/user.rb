class User < ApplicationRecord
  has_friendship

  def payment(friend_id,amount,description = "NA")
    ActiveRecord::Base.transaction do
      self.balance = self.balance.to_f - amount.to_f
      self.save!
      friend = User.find_by(friend_id)
      friend.balance = balance.to_f +  amount.to_f
      friend.save!
      t = Transaction.create(user_to: friend_id, user_from: id, amount: amount, description: description)
    end
  end
end
