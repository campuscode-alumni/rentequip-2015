class Equipment < ActiveRecord::Base
  validates :name, presence: true
  has_and_belongs_to_many :contracts
end
