class User < ApplicationRecord
  has_many :transactions
  has_friendship
end
