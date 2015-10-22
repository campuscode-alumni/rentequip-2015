class AddEquipmentCategoryRefToEquipment < ActiveRecord::Migration
  def change
    add_reference :equipment, :category_equipment, index: true, foreign_key: true
  end
end
