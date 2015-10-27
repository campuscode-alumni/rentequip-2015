require 'rails_helper'

describe Contract do
  it 'calc rental period' do
    contract = create(:contract)

    expect(contract.devolution_date)
      .to eq(contract.created_at.to_date + contract.rental_period.period)
  end

  it 'calc total value' do
    category = create(:equipment_category)

    price = create(:price, equipment_category: category)

    equipment = create(:equipment, equipment_category: category)

    contract = build(:contract, rental_period: price.rental_period)

    rented_equipment = create(:rented_equipment,
                              contract: contract,
                              price: price,
                              equipment: equipment)

    contract.rented_equipments = [rented_equipment]

    expect(contract.total_value).to eq(price.total)
  end

  it 'not should be zero' do
    price = create(:price)

    equipment = create(:equipment)
    equipment.equipment_category.prices = [price]

    rental = create(:rental_period, description: 'Quinzenal', period: 15)

    contract = create(:contract, rental_period: rental, equipment: [equipment])

    expect(contract.total_value).to be_zero
  end
end
