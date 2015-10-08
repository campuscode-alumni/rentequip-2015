require 'rails_helper'

describe Contract do
  it 'calc rental period' do
    contract = create(:contract)

    expect(contract.devolution_date)
      .to eq(contract.created_at.to_date + contract.rental_period.period)
  end

  it 'calc total value' do
    price = create(:price)

    equipment = create(:equipment, prices: [price])

    contract = create(:contract, equipment: [equipment])

    expect(contract.total_value).to eq(price.total)
  end

  it 'not should be zero' do
    price = create(:price)

    equipment = create(:equipment, prices: [price])

    rental = create(:rental_period, description: 'Quinzenal', period: 15)

    contract = create(:contract, rental_period: rental, equipment: [equipment])

    expect(contract.total_value).to be_zero
  end
end
