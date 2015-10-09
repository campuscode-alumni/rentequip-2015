class Contract < ActiveRecord::Base
  belongs_to :customer
  has_and_belongs_to_many :equipment
  belongs_to :rental_period

  def devolution_date
    created_at.to_date + rental_period.period
  end

end
