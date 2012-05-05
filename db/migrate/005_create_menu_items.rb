class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :title
      t.text :description
      t.integer :price_pound
      t.integer :price_pence

      t.timestamps
    end
  end
end
