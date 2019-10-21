class AddAttachmentAlbumCoverToSongs < ActiveRecord::Migration[5.2]
  def self.up
    change_table :songs do |t|
      t.attachment :album_cover
    end
  end

  def self.down
    remove_attachment :songs, :album_cover
  end
end
