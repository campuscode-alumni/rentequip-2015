class Contract < ActiveRecord::Base
  belongs_to :customer
  # rubocop: disable Rails/HasAndBelongsToMany
  has_and_belongs_to_many :equipment
  # rubocop: enable Rails/HasAndBelongsToMany
  belongs_to :rental_period

  def devolution_date
    created_at.to_date + rental_period.period
  end
end
