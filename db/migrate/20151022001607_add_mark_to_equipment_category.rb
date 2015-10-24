class AddMarkToEquipmentCategory < ActiveRecord::Migration
  def change
    add_column :equipment_categories, :mark, :string
  end
end
