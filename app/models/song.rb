class Song < ApplicationRecord
  has_many :selections, :dependent => :destroy
  has_many :votes, through: :selections
  
  validates_uniqueness_of :spotify_id
  
end
