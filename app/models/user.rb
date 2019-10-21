class User < ApplicationRecord
  has_secure_password
  has_many :votes, dependent: :destroy
end
