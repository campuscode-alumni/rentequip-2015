class RentalPeriod < ActiveRecord::Base
  has_many :contracts
end
