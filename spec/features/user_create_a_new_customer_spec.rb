require 'rails_helper'
feature 'User create a new customer' do
  scenario 'successfully' do
    visit new_customer_path
    fill_in 'Nome', with: 'Mario'
    fill_in 'CPF', with: '13345402214'
    fill_in 'Endereço', with: 'Rua do Campus'
    fill_in 'RG', with: '22.22.22'
    fill_in 'Email', with: 'campus@campus.com'
    fill_in 'Telefone', with: '11 999999999'
    fill_in 'Celular', with: '11 888888888'
    fill_in 'Data de Nascimento', with: '01/01/2001'

    click_on 'Save'
    expect(page).to have_content 'Mario'
    expect(page).to have_content '13345402214'
    expect(page).to have_content 'Rua do Campus'
    expect(page).to have_content '22.22.22'
    expect(page).to have_content 'campus@campus.com'
    expect(page).to have_content '11 999999999'
    expect(page).to have_content '11 888888888'
    expect(page).to have_content '01/01/2001'

  end

  scenario 'unsuccesfuly' do
    visit new_customer_path

    click_on 'Save'

    expect(page).to have_content 'Warning! All fields are mandatory.'
  end
end
