require 'rails_helper'

feature 'User create a new contract' do
  scenario 'successfuly' do

    customer = create(:customer)

    equipment = create(:equipment)

    rental_period = create(:rental_period)

    visit new_contract_path

    select customer.name, from: 'Cliente'
    check equipment.name
    select rental_period.description, from: 'Prazo de locação'
    fill_in 'Forma de pagamento', with: 'Á vista'
    fill_in 'Endereço de entrega', with: 'Av Paulista, 1985'

    click_on "Criar Contrato"

    expect(page).to have_content customer.name
    expect(page).to have_content equipment.name
    expect(page).to have_content rental_period.description
    expect(page).to have_content "Á vista"
    expect(page).to have_content "Av Paulista, 1985"
  end
end
