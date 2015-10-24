class EquipmentCategory < ActiveRecord::Base
  validates :name, presence: true
  has_many :equipment

  def to_s
    "#{name} - #{model} - #{mark}"
  end
end
