class User < ApplicationRecord
  has_friendship

  def payment(friend_id,amount,description = "NA")
    t = Transaction.new(user_to: friend_id, user_from: id, amount: amount, description: description)
    t.save
  end

end
