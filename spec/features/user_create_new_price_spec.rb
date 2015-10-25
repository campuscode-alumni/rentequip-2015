require 'rails_helper'

feature 'User create prices' do
  scenario 'successfuly' do
    equipment_category = create(:equipment_category)
    rental_period = create(:rental_period)

    visit new_price_path

    select(equipment_category, from: 'Equipment')
    select(rental_period.description, from: 'Rental period')
    fill_in 'Total', with: '10.9'

    click_on 'Salvar Preço'

    expect(page).to have_content equipment_category
    expect(page).to have_content rental_period.description
    expect(page).to have_content '10.9'
  end

  scenario 'unsuccessfuly' do
    visit new_price_path

    click_on 'Salvar Preço'

    expect(page).to have_content 'Warning! All fields are mandatory.'
  end
end
