require 'rails_helper'

feature 'User create a new contract' do
  scenario 'successfuly' do

    customer = Customer.create name: 'Wesley',
                               cpf: '123123123456',
                               address: 'Rua Pedro',
                               phone: '21215454',
                               cell: '95957676',
                               rg: '415678956',
                               email: 'teste@teste.com',
                               birthdate: '21/09/2015'

    equipment = Equipment.create name: 'Betoneira'

    visit new_contract_path

    select customer.name, from: 'Customer'
    check 'Betoneira'
    fill_in 'Time', with: '3 dias'
    fill_in 'Payment method', with: 'Á vista'
    fill_in 'Devolution date', with: '05/10/2015'
    fill_in 'Delivery address', with: 'Av Paulista'

    click_on "Criar Contrato"

    expect(page).to have_content customer.name
    expect(page).to have_content "Betoneira"
    expect(page).to have_content "3 dias"
    expect(page).to have_content "Á vista"
    expect(page).to have_content "05/10/2015"
    expect(page).to have_content "Av Paulista"
  end
end
