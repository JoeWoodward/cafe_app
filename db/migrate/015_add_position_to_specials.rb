class AddPositionToSpecials < ActiveRecord::Migration
  def change
    add_column :specials, :position, :integer
  end
end
