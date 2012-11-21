class CreateFlyers < ActiveRecord::Migration
  def change
    create_table :flyers do |t|
      t.date :happened_on
      t.references :venue
      t.text :notes

      t.timestamps
    end
    add_index :flyers, :venue_id

    create_table :bands_flyers do |t|
      t.references :band
      t.references :flyer
    end
    add_index :bands_flyers, :band_id
    add_index :bands_flyers, :flyer_id
  end
end
