class Customer < ActiveRecord::Base
  validates :name, :cpf, presence: true
end
