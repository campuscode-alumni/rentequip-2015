require 'rails_helper'

feature 'User views equipment data' do
  scenario 'successfully' do
    equipment = create(:equipment)
    visit equipment_index_path
    click_on equipment
    expect(page).to have_content equipment.equipment_category.name
    expect(page).to have_content equipment.equipment_category.mark
    expect(page).to have_content equipment.equipment_category.model
    expect(page).to have_content equipment.supplier
    expect(page).to have_content equipment.asset_number
    expect(page).to have_content equipment.purchased_at
    expect(page).to have_content equipment.acquisition_price
  end

  scenario 'and back to list equipment' do
    equipment1 = create(:equipment)
    equipment_category2 = create(:equipment_category, name: 'Martelo')
    equipment2 = create(:equipment, equipment_category: equipment_category2)
    visit equipment_index_path
    expect(page).to have_content equipment1
    expect(page).to have_content equipment2
  end
end
