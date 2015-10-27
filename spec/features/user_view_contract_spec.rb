require 'rails_helper'

feature 'user should view contract' do
  scenario 'successfully' do
    category = create(:equipment_category)

    price = create(:price, equipment_category: category)

    equipment = create(:equipment, equipment_category: category)

    contract = build(:contract, rental_period: price.rental_period)

    rented_equipment = create(:rented_equipment,
                              contract: contract,
                              price: price,
                              equipment: equipment)

    contract.rented_equipments = [rented_equipment]

    visit contract_path(contract)

    expect(page).to have_content contract.customer.name
    expect(page).to have_content contract.customer.address
    expect(page).to have_content contract.customer.cpf
    expect(page).to have_content equipment
    expect(page).to have_content rented_equipment.price.total
    expect(page).to have_content equipment.acquisition_price
    expect(page).to have_content contract.rental_period.description
    expect(page).to have_content contract.payment_method
    expect(page).to have_content contract.total_value
  end
end
