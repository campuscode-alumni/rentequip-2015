class RemoveModelAndNameFromEquipment < ActiveRecord::Migration
  def change
    remove_column :equipment, :model, :string
    remove_column :equipment, :name, :string
  end
end
