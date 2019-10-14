class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.string :album
      t.float :length

      t.timestamps
    end
  end
end
