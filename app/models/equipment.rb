class Equipment < ActiveRecord::Base
  belongs_to :equipment_category
  validates :equipment_category, presence: true
  has_many :rented_equipments

  def to_s
    "#{equipment_category} - Patrimônio: #{asset_number}"
  end
end
