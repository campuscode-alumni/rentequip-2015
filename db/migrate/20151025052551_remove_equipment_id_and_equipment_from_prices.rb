class RemoveEquipmentIdAndEquipmentFromPrices < ActiveRecord::Migration
  def change
    remove_column :prices, :equipment_id, :integer
    remove_column :prices, :equipment, :string
  end
end
