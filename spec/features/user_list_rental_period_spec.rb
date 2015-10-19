require 'rails_helper'

feature 'User list rental periods' do
  scenario 'successfully' do
    rental_period = create(:rental_period)
    visit rental_periods_path
    expect(page).to have_content rental_period.description
  end

  scenario 'User list two itens' do
    rental_period = create(:rental_period)
    rental_period2 = create(:rental_period, description: 'Anual')
    visit rental_periods_path
    expect(page).to have_content rental_period.description
    expect(page).to have_content rental_period2.description
  end
end
