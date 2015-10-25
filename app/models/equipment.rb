class Equipment < ActiveRecord::Base
  belongs_to :equipment_category
  validates :equipment_category, presence: true
  # rubocop: disable Rails/HasAndBelongsToMany
  has_and_belongs_to_many :contracts
  # rubocop: enable Rails/HasAndBelongsToMany

  def to_s
    "#{equipment_category} - Patrimônio: #{asset_number}"
  end
end
