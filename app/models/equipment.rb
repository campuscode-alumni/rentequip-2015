class Equipment < ActiveRecord::Base
  has_many :prices
  validates :name, presence: true
  has_and_belongs_to_many :contracts
end
