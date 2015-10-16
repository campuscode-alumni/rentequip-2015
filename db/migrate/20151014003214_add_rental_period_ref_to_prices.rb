class AddRentalPeriodRefToPrices < ActiveRecord::Migration
  def change
    add_reference :prices, :rental_period, index: true, foreign_key: true
  end
end
