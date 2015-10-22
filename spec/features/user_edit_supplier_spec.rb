require 'rails_helper'
feature 'User edit supplier' do
  scenario 'successfully' do
    supplier = create(:supplier)
    visit edit_supplier_path(supplier)

    fill_in 'Nome', with: 'Ferramentas Lion'
    fill_in 'Endereço', with: 'Rua das Ferramentas'
    fill_in 'CNPJ', with: '1234567890000187'
    fill_in 'Gerente de Contas', with: 'Emanuel'
    fill_in 'Compania', with: 'Lion'
    fill_in 'E-mail', with: 'lion@lion.com'
    fill_in 'Telefone', with: '912341234'
    fill_in 'Site', with: 'www.lion.com'
    fill_in 'Inscrição Municipal', with: '123456'
    fill_in 'Inscrição Estadual', with: '555888'

    click_button 'Salvar Fornecedor'

    expect(page).to have_content 'Ferramentas Lion'
    expect(page).to have_content 'Rua das Ferramentas'
    expect(page).to have_content '1234567890000187'
    expect(page).to have_content 'Emanuel'
    expect(page).to have_content 'Lion'
    expect(page).to have_content 'lion@lion.com'
    expect(page).to have_content '912341234'
    expect(page).to have_content 'www.lion.com'
    expect(page).to have_content '123456'
    expect(page).to have_content '555888'
  end

  scenario 'using empty name' do
    supplier = create(:supplier)
    visit edit_supplier_path(supplier)

    fill_in 'Nome', with: ''

    click_button 'Salvar Fornecedor'

    expect(page).to have_content 'Atenção! Nome é um campo obrigatório.'
  end

  scenario 'using empty cnpj' do
    supplier = create(:supplier)
    visit edit_supplier_path(supplier)

    fill_in 'CNPJ', with: ''

    click_button 'Salvar Fornecedor'

    expect(page).to have_content 'Atenção! CNPJ é um campo obrigatório.'
  end
end
