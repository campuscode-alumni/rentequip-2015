class RemoveMarkFromEquipment < ActiveRecord::Migration
  def change
    remove_column :equipment, :mark, :string
  end
end
