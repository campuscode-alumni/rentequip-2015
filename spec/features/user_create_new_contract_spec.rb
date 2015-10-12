require 'rails_helper'

feature 'User create a new contract' do
  scenario 'successfuly' do

    customer = create(:customer)

    equipment = create(:equipment)

    visit new_contract_path

    select customer.name, from: 'Customer'
    check 'Furadeira'
    fill_in 'Time', with: '3 dias'
    fill_in 'Payment method', with: 'Á vista'
    fill_in 'Devolution date', with: '05/10/2015'
    fill_in 'Delivery address', with: 'Av Paulista, 1985'

    click_on "Criar Contrato"

    expect(page).to have_content customer.name
    expect(page).to have_content equipment.name
    expect(page).to have_content "3 dias"
    expect(page).to have_content "Á vista"
    expect(page).to have_content "05/10/2015"
    expect(page).to have_content "Av Paulista, 1985"
  end
end
