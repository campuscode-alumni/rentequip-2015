require 'rails_helper'
feature 'User create equipment category' do
  scenario 'successfully ' do
    visit new_equipment_category_path
    fill_in 'Tipo:', with: 'Furadeira'
    fill_in 'Modelo:', with: 'FD343'
    fill_in 'Marca:', with: 'Makita'

    click_on 'Cadastrar categoria'

    expect(page).to have_content 'Furadeira'
    expect(page).to have_content 'FD343'
    expect(page).to have_content 'Makita'
  end

  scenario 'click_on Voltar' do
    equipment_category1 = create(:equipment_category)
    equipment_category2 = create(:equipment_category, name: 'Betoneira')
    visit equipment_category_path(equipment_category1.id)

    click_on 'Voltar'
    expect(page).to have_content "##{equipment_category1.id} -
                                  #{equipment_category1.name}"
    expect(page).to have_content "##{equipment_category2.id} -
                                  #{equipment_category2.name}"
  end

  scenario 'Validate name' do
    visit new_equipment_category_path
    fill_in 'Tipo', with: ''

    click_button 'Cadastrar categoria'

    expect(page).to have_content 'Tipo é obrigatório'
  end
end
