require 'rails_helper'

feature 'User list equipment' do
  scenario 'list only one equipment' do
    equipment = create(:equipment)
    visit equipment_index_path
    expect(page).to have_content equipment.description
  end

  scenario 'list two equipment' do
    equipment1 = create(:equipment)
    equipment_category2 = create(:equipment_category, name: 'Martelo')
    equipment2 = create(:equipment, equipment_category: equipment_category2)
    visit equipment_index_path
    expect(page).to have_content equipment1.description
    expect(page).to have_content equipment2.description
  end
end
