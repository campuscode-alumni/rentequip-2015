class Price < ActiveRecord::Base
  belongs_to :rental_period
  belongs_to :equipment
  validates :equipment, :rental_period, :total, presence: true
end
