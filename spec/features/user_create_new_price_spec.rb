require 'rails_helper'

feature 'User create prices' do
  scenario 'successfuly' do
    equipment = create(:equipment)

    visit new_price_path

    select(equipment.name, from: 'Equipment')
    select('3 dias', from: 'Time')
    fill_in 'Total', with: '150.00'

    click_on 'Salvar Preço'

    expect(page).to have_content equipment.name
    expect(page).to have_content 3
    expect(page).to have_content '150.0'
  end

  scenario 'unsuccessfuly' do
    visit new_price_path

    click_on 'Salvar Preço'

    expect(page).to have_content 'Warning! All fields are mandatory.'
  end
end
