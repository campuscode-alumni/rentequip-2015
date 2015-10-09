class AddContractRefToContractsEquipments < ActiveRecord::Migration
  def change
    add_reference :contracts_equipments, :contract, index: true, foreign_key: true
  end
end
