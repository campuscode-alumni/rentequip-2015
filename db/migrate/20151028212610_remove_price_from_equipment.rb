class RemovePriceFromEquipment < ActiveRecord::Migration
  def change
    remove_column :equipment, :price, :float
  end
end
