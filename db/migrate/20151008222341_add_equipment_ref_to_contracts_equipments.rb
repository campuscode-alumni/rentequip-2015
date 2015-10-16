class AddEquipmentRefToContractsEquipments < ActiveRecord::Migration
  def change
    add_reference :contracts_equipments, :equipment, index: true, foreign_key: true
  end
end
