class Customer < ActiveRecord::Base
  has_many :contracts
  validates :name, :cpf, presence: true
end
