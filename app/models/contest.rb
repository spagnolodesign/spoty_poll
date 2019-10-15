class Contest < ApplicationRecord

  has_many :selections, dependent: :destroy
  has_many :songs, through: :selections

  enum state: [:active, :voting, :finished]

  # validation
  validates_presence_of :topic

end
