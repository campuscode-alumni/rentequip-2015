require 'rails_helper'

feature 'User views equipment data' do
  scenario 'successfully' do
    equipment = create(:equipment)
    visit equipment_index_path
    click_on equipment.name
    expect(page).to have_content equipment.name
    expect(page).to have_content equipment.mark
    expect(page).to have_content equipment.supplier
    expect(page).to have_content equipment.price
    expect(page).to have_content equipment.model
    expect(page).to have_content equipment.asset_number
    expect(page).to have_content equipment.purchased_at
    expect(page).to have_content equipment.acquisition_price
  end

  scenario 'and back to list equipment' do
    equipment1 = create(:equipment)
    equipment2 = create(:equipment, name: 'Martelo')
    visit equipment_path(equipment1)
    click_on 'Voltar'
    expect(page).to have_content equipment1.name
    expect(page).to have_content equipment2.name
  end
end
