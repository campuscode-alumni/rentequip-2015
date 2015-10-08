class Equipment < ActiveRecord::Base
  has_many :prices
  validates :name, presence: true
end
