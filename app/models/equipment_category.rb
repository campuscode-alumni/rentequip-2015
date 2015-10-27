class EquipmentCategory < ActiveRecord::Base
  validates :name, presence: true
  has_many :equipment
  has_many :prices
  def to_s
    "#{name} - #{model} - #{mark}"
  end

  def price_by_rental_period(rental_period)
    prices.joins(:rental_period)
      .where(rental_periods: { period: rental_period.period }).last
  end
end
