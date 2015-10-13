class Contract < ActiveRecord::Base
  belongs_to :customer
  has_and_belongs_to_many :equipment
  belongs_to :rental_period
end
