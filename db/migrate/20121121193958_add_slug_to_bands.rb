class AddSlugToBands < ActiveRecord::Migration
  def change
    add_column :bands, :slug, :string
    add_index :bands, :slug
  end
end
