class CreateSpecials < ActiveRecord::Migration
  def change
    create_table :specials do |t|
      t.string :title
      t.text :description
      t.integer :price_pound
      t.integer :price_pence

      t.timestamps
    end
  end
end
