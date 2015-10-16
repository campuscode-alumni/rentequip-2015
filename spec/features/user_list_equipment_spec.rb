require 'rails_helper'

feature 'User list equipment' do
  scenario 'list only one equipment' do
    equipment = create(:equipment)
    visit equipment_index_path
    expect(page).to have_content equipment.name
  end

  scenario 'list two equipment' do
    equipment1 = create(:equipment)
    equipment2 = create(:equipment, name: 'Martelo')
    visit equipment_index_path
    expect(page).to have_content equipment1.name
    expect(page).to have_content equipment2.name
  end
end
