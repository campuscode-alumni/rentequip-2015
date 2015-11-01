class Contract < ActiveRecord::Base
  belongs_to :customer
  has_many :rented_equipments
  belongs_to :rental_period
  has_many :bills

  validates :customer, :rental_period, :payment_method,
            :delivery_address, presence: true

  def devolution_date
    created_at.to_date + rental_period.period
  end

  def total_value
    total = 0
    rented_equipments.each do |rented_equipment|
      price = rented_equipment.price
      total += price.total if price
    end
    total
  end
end
