class Selection < ApplicationRecord
  belongs_to :contest
  belongs_to :song
  has_many :votes
end
