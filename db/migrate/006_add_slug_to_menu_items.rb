class AddSlugToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :slug, :string
    add_index :menu_items, :slug
  end
end
