FactoryGirl.define do
  factory :contract do
    payment_method 'Á vista'
    delivery_address 'Av Paulista, 1234'
    customer
    rental_period
  end
end
