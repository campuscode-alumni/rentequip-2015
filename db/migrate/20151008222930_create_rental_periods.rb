class CreateRentalPeriods < ActiveRecord::Migration
  def change
    create_table :rental_periods do |t|
      t.string :description
      t.integer :period

      t.timestamps null: false
    end
  end
end
