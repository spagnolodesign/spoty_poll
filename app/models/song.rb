class Song < ApplicationRecord
  has_many :selections, :dependent => :destroy
  has_many :votes, through: :selections
  
  validates_uniqueness_of :spotify_id

  has_attached_file :album_cover, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment :album_cover, presence: true
  do_not_validate_attachment_file_type :album_cover
  
  def album_cover_from_url(url)
    self.album_cover = open(url)
  end

end
