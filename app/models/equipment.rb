class Equipment < ActiveRecord::Base
  has_many :prices
  validates :name, presence: true
  # rubocop: disable Rails/HasAndBelongsToMany
  has_and_belongs_to_many :contracts
  # rubocop: enable Rails/HasAndBelongsToMany

  def price_by_rental_period(rental_period)
    prices.joins(:rental_period)
      .where(rental_periods: { period: rental_period.period }).last
  end
end
