require 'rails_helper'

feature 'User edit customer' do
  scenario 'successfully' do
    customer = create(:customer)
    visit edit_customer_path(customer)

    fill_in 'Nome', with: 'Alan'
    fill_in 'CPF', with: '35336197882'
    fill_in 'Endereço', with: 'Rua Santa Felicia'
    fill_in 'Telefone', with: '1185478559'
    fill_in 'Celular', with: '11874582568'
    fill_in 'RG', with: '4558544465'
    fill_in 'Email', with: 'teste@teste.com.br'
    fill_in 'Data de nascimento', with: '07/05/1987'

    click_on 'Salvar cliente'

    expect(page).to have_content 'Alan'
    expect(page).to have_content '35336197882'
    expect(page).to have_content 'Rua Santa Felicia'
    expect(page).to have_content '1185478559'
    expect(page).to have_content '11874582568'
    expect(page).to have_content '4558544465'
    expect(page).to have_content 'teste@teste.com.br'
    expect(page).to have_content '07/05/1987'
  end

  scenario 'insert invalid values' do
    customer = create(:customer)
    visit edit_customer_path(customer)

    fill_in 'Nome', with: ''
    fill_in 'CPF', with: ''

    click_on 'Salvar cliente'

    expect(page).to have_content 'Atenção! Todos os campos são obrigatórios'
  end
end
