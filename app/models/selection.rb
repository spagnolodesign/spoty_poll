class Selection < ApplicationRecord
  belongs_to :contest
  belongs_to :song
  belongs_to :user
  has_many :votes, dependent: :destroy

  scope :order_by_most_votes, -> {
    order('votes_count DESC')
  }
end
