require 'rails_helper'

feature 'User create a new contract' do
  scenario 'successfuly' do
    rental_period = create(:rental_period)

    equipment1 = create(:equipment)
    equipment1.prices << build(:price,
                               equipment: nil,
                               rental_period: rental_period)

    equipment2 = create(:equipment, name: 'Betoneira')
    equipment2.prices << build(:price,
                               equipment: nil,
                               rental_period: rental_period)

    customer = create(:customer)

    devolution_date = rental_period.created_at.to_date + rental_period.period

    visit new_contract_path

    select customer.name, from: 'Cliente'
    check equipment1.name
    check equipment2.name
    select rental_period.description, from: 'Prazo de locação'
    choose 'Á vista'

    fill_in 'Endereço de entrega', with: 'Av Paulista, 1985'

    click_on 'Criar Contrato'

    expect(page).to have_content customer.name
    expect(page).to have_content equipment1.name
    expect(page).to have_content equipment2.name
    expect(page).to have_content rental_period.description
    expect(page).to have_content 'Á vista'
    expect(page).to have_content 'Av Paulista, 1985'
    expect(page).to have_content devolution_date
    expect(page).to have_content '21.0'
  end
end
