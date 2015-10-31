class Contract < ActiveRecord::Base
  belongs_to :customer
  # rubocop: disable Rails/HasAndBelongsToMany
  has_and_belongs_to_many :equipment
  # rubocop: enable Rails/HasAndBelongsToMany
  belongs_to :rental_period
  has_many :bills
  has_one :delivery_receipt
  validates :customer, :rental_period, :payment_method,
            :delivery_address, presence: true

  def devolution_date
    created_at.to_date + rental_period.period
  end

  def total_value
    total = 0
    equipment.each do |e|
      price = e.equipment_category.price_by_rental_period(rental_period)
      total += price.total if price
    end
    total
  end
end
