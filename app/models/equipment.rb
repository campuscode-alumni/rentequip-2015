class Equipment < ActiveRecord::Base
  validates :name, presence: true
end
