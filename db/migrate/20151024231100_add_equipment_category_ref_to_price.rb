class AddEquipmentCategoryRefToPrice < ActiveRecord::Migration
  def change
    add_reference :prices, :equipment_category, index: true, foreign_key: true
  end
end
