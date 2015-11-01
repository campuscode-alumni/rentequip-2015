class RemoveContractsEquipment < ActiveRecord::Migration
  def change
    drop_table :contracts_equipment
  end
end
