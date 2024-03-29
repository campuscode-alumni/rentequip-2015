require 'rails_helper'

feature 'User create a new bill' do
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

    click_on 'Gerar Fatura'

    expect(page).to have_content('Fatura #1')
    expect(page).to have_content(contract.id)
    expect(page).to have_content(contract.total_value)
    expect(page).to have_content(equipment)
    expect(page).to have_content('Locadora Campus Code')
    expect(page).to have_content(contract.customer.name)
    expect(page).to have_content(contract.customer.address)
    expect(page).to have_content(contract.customer.cpf)
  end
end
