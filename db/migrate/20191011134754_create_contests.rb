class CreateContests < ActiveRecord::Migration[5.2]
  def change
    create_table :contests do |t|
      t.string :topic
      t.integer :state
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
