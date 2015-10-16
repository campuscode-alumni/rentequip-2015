class Supplier < ActiveRecord::Base
  validates :cnpj, :name, presence: true
end
