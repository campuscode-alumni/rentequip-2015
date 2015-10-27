class Price < ActiveRecord::Base
  belongs_to :rental_period
  belongs_to :equipment_category
  has_many :rented_equipments
  validates :equipment_category, :rental_period, :total, presence: true
end
