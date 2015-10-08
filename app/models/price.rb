class Price < ActiveRecord::Base
  belongs_to :equipment
  validates :equipment, :time, :total, presence: true
end
