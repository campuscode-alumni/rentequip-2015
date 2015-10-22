class AddContractRefToBills < ActiveRecord::Migration
  def change
    add_reference :bills, :contract, index: true, foreign_key: true
  end
end
