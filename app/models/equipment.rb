class Equipment < ActiveRecord::Base
  has_many :prices
  validates :name, presence: true
  # rubocop: disable Rails/HasAndBelongsToMany
  has_and_belongs_to_many :contracts
  # rubocop: enable Rails/HasAndBelongsToMany
end
