class Transaction < ApplicationRecord
  paginates_per 10

  def payment(user_id, friend_id, amount, description = "NA")
    ok_transaction = false
    ActiveRecord::Base.transaction do
      sender = User.where(id: user_id).first
      friend = User.where(id: friend_id).first
      sender.balance = sender.balance.to_f - amount.to_f
      friend.balance = friend.balance.to_f + amount.to_f
      friend.save!
      sender.save!
      t = Transaction.create(user_to: friend_id, user_from: id, amount: amount, description: description)
      ok_transaction = true
    end
    ok_transaction
  end
end
