class RentalPeriod < ActiveRecord::Base
  has_many :contracts
  validates :description, :period, presence: true
  validates :period, numericality: { only_integer: true }
end
