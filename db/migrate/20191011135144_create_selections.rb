class CreateSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :selections do |t|
      t.belongs_to :song
      t.belongs_to :contest
      t.belongs_to :user
    end
  end
end
