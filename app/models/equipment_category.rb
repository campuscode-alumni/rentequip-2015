class EquipmentCategory < ActiveRecord::Base
  validates :name, presence: true
  has_many :equipment
end
