require 'rails_helper'
feature 'User create new supplier' do
  scenario 'successfuly' do
    visit new_supplier_path
    fill_in 'Nome', with: 'Sei-la Corp'
    fill_in 'Endereço', with: 'Alameda Santos'
    fill_in 'CNPJ', with: '123456789/0001'
    fill_in 'Gerente de Contas', with: 'Douglas'
    fill_in 'Compania', with: 'Sei-la Corp'
    fill_in 'E-mail', with: 'info@seila.com'
    fill_in 'Telefone', with: '+55119547844'
    fill_in 'Site', with: 'www.seila.com'
    fill_in 'Inscrição Municipal', with: '1234567890'
    fill_in 'Inscrição Estadual', with: '123456789'

    click_on 'Criar Fornecedor'
    expect(page).to have_content 'Sei-la Corp'
    expect(page).to have_content 'Alameda Santos'
    expect(page).to have_content '123456789/0001'
    expect(page).to have_content 'Douglas'
    expect(page).to have_content 'Sei-la Corp'
    expect(page).to have_content 'info@seila.com'
    expect(page).to have_content '+55119547844'
    expect(page).to have_content 'www.seila.com'
    expect(page).to have_content '1234567890'
    expect(page).to have_content '1234567890'
  end

  scenario 'using empty name' do
    visit new_supplier_path

    fill_in 'Nome', with: ''
    fill_in 'Endereço', with: 'Alameda Santos'
    fill_in 'CNPJ', with: '123456789/0001'
    fill_in 'Gerente de Contas', with: 'Douglas'
    fill_in 'Compania', with: 'Sei-la Corp'
    fill_in 'E-mail', with: 'info@seila.com'
    fill_in 'Telefone', with: '+55119547844'
    fill_in 'Site', with: 'www.seila.com'
    fill_in 'Inscrição Municipal', with: '1234567890'
    fill_in 'Inscrição Estadual', with: '123456789'

    click_button 'Criar Fornecedor'

    expect(page).to have_content 'Atenção! Nome é um campo obrigatório.'
  end

  scenario 'using empty cnpj' do
    visit new_supplier_path

    fill_in 'Nome', with: 'Sei-la Corp'
    fill_in 'Endereço', with: 'Alameda Santos'
    fill_in 'CNPJ', with: ''
    fill_in 'Gerente de Contas', with: 'Douglas'
    fill_in 'Compania', with: 'Sei-la Corp'
    fill_in 'E-mail', with: 'info@seila.com'
    fill_in 'Telefone', with: '+55119547844'
    fill_in 'Site', with: 'www.seila.com'
    fill_in 'Inscrição Municipal', with: '1234567890'
    fill_in 'Inscrição Estadual', with: '123456789'

    click_button 'Criar Fornecedor'

    expect(page).to have_content 'Atenção! CNPJ é um campo obrigatório.'
  end
end
