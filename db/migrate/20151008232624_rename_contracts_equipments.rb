class RenameContractsEquipments < ActiveRecord::Migration
  def change
    remove_reference :contracts_equipments, :equipment, index: true, foreign_key: true
    remove_reference :contracts_equipments, :contract, index: true, foreign_key: true
    rename_table('contracts_equipments', 'contracts_equipment')
    add_reference :contracts_equipment, :equipment, index: true, foreign_key: true
    add_reference :contracts_equipment, :contract, index: true, foreign_key: true
  end
end
