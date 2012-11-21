class AddSlugToFlyers < ActiveRecord::Migration
  def change
    add_column :flyers, :slug, :string
    add_index :flyers, :slug
  end
end
