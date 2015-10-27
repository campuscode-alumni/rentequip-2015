class RentedEquipment < ActiveRecord::Base
  belongs_to :contract
  belongs_to :equipment
  belongs_to :price

  before_save :set_price

  def equipment_name
    equipment.equipment_category.name
  end

  private

  def set_price
    self.price = equipment.equipment_category
      .price_by_rental_period(contract.rental_period)
  end
end
