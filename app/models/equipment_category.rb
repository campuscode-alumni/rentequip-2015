class EquipmentCategory < ActiveRecord::Base
  validates :name, presence: true
end
