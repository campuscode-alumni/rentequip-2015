FactoryGirl.define do
  factory :equipment do
    equipment_category
    supplier 'Extra'
    asset_number 1
    purchased_at '2015-10-05'
    acquisition_price 1.5
  end
end
