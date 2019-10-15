class Selection < ApplicationRecord
  belongs_to :contest
  belongs_to :song
  belongs_to :user
  has_many :votes
end
