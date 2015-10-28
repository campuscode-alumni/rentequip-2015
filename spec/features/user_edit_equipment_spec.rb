require 'rails_helper'
feature 'User edit equipment' do
  scenario 'successfully' do
    equipment = create(:equipment)
    equipment_category = create(:equipment_category, name: 'Furadeira',
                                                     mark: 'Black & Decker',
                                                     model: 'BD4567')

    visit edit_equipment_path(equipment)

    select equipment_category, from: 'Equipamento'
    fill_in 'Fornecedor', with: 'Joly'
    fill_in 'Patrimônio', with: '887766'
    fill_in 'Data da compra', with: '20/10/2012'
    fill_in 'Preço do equipamento', with: 77.80

    click_on 'Salvar equipamento'

    expect(page).to have_content 'Furadeira'
    expect(page).to have_content 'BD4567'
    expect(page).to have_content 'Black & Decker'
    expect(page).to have_content 'Joly'
    expect(page).to have_content '887766'
    expect(page).to have_content '20/10/2012'
    expect(page).to have_content 77.80
  end
end
