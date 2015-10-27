class CreateRentedEquipments < ActiveRecord::Migration
  def change
    create_table :rented_equipments do |t|
      t.references :contract, index: true, foreign_key: true
      t.references :equipment, index: true, foreign_key: true
      t.references :price, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
