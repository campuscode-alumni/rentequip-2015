class AddEquipmentCategoryRefToEquipment < ActiveRecord::Migration
  def change
    add_reference :equipment, :equipment_category, index: true, foreign_key: true
  end
end
