require 'rails_helper'

feature 'Create Equipment' do
  scenario 'successfully' do
    equipment_category = create(:equipment_category)
    visit new_equipment_path

    select equipment_category, from: 'Equipamento'
    fill_in 'Fornecedor', with: 'Extra'
    fill_in 'Preço de locação', with: '23.80'
    fill_in 'Patrimônio', with: '123546'
    fill_in 'Data da compra', with: '05/10/2015'
    fill_in 'Preço do equipamento', with: '80.00'

    click_button 'Cadastrar equipamento'

    expect(page).to have_content equipment_category.name
    expect(page).to have_content equipment_category.model
    expect(page).to have_content equipment_category.mark
    expect(page).to have_content 'Extra'
    expect(page).to have_content 23.80
    expect(page).to have_content '123546'
    expect(page).to have_content '2015-10-05'
    expect(page).to have_content 80.00
  end

  scenario 'invalid equipment' do
    visit new_equipment_path

    click_button 'Cadastrar equipamento'

    expect(page).to have_content 'Categoria é obrigatória.'
  end

  scenario 'click_on Voltar' do
    equipment = create(:equipment)
    visit equipment_path(equipment.id)

    click_on 'Voltar'
    expect(page).to have_content equipment
  end
end
