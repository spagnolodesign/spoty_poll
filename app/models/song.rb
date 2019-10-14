class Song < ApplicationRecord
  has_many :selections, :dependent => :destroy
end
