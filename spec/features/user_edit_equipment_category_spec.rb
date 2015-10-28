require 'rails_helper'
feature 'User edit equipment category' do
  scenario 'successfully' do
    equipment_category = create(:equipment_category)

    visit edit_equipment_category_path(equipment_category)

    fill_in 'Tipo:', with: 'Betoneira'
    fill_in 'Modelo:', with: 'FRT567'
    fill_in 'Marca:', with: 'Makita'

    click_on 'Salvar categoria'

    expect(page).to have_content 'Betoneira'
    expect(page).to have_content 'FRT567'
    expect(page).to have_content 'Makita'
  end
end
