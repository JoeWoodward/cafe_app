class AddCategoryIdToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :category_id, :integer
  end
end
