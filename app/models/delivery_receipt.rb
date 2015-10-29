class DeliveryReceipt < ActiveRecord::Base
  auto_increment :number
  has_one :contract
end
