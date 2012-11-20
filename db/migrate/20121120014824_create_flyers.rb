class CreateFlyers < ActiveRecord::Migration
  def change
    create_table :flyers do |t|
      t.date :happened_on
      t.references :venue
      t.text :notes

      t.timestamps
    end
    add_index :flyers, :venue_id
  end
end
