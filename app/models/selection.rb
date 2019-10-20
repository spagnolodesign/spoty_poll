class Selection < ApplicationRecord
  belongs_to :contest
  belongs_to :song
  belongs_to :user
  has_many :votes, dependent: :destroy

  scope :order_by_most_votes, -> {
    order('votes_count DESC')
  }
  
  # Validations
  validates_uniqueness_of :song, scope: [:contest]

  # Validate uniqe selection by same user in contest
  # To implement exepction only for winner of previus contest.
  validates_uniqueness_of :user , scope:[:contest], message: "You have alredy a selection for this contest"
end
