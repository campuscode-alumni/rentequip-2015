require 'rails_helper'

feature 'User create a new contract' do
  scenario 'successfuly' do

    visit new_contract_path

    fill_in 'Customer', with: 'Sandro'
    fill_in 'Equipment', with: 'Betoneira'
    fill_in 'Time', with: '3 dias'
    fill_in 'Payment method', with: 'Á vista'
    fill_in 'Devolution date', with: '05/10/2015'
    fill_in 'Delivery address', with: 'Av Paulista'

    click_on "Criar Contrato"

    expect(page).to have_content "Sandro"
    expect(page).to have_content "Betoneira"
    expect(page).to have_content "3 dias"
    expect(page).to have_content "Á vista"
    expect(page).to have_content "05/10/2015"
    expect(page).to have_content "Av Paulista"
  end
end
