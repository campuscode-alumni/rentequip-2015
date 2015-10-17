class RentalPeriod < ActiveRecord::Base
  has_many :contracts
  validates :description, :period, presence: true
end
