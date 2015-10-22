class Bill < ActiveRecord::Base
  belongs_to :contract
  auto_increment :number
end
