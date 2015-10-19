require 'rails_helper'

  feature 'User view rental periods data' do
    scenario 'successfully' do
      rental_period = create(:rental_period)
      visit rental_periods_path
      click_on rental_period.description
      expect(page).to have_content rental_period.description
      expect(page).to have_content rental_period.period
    end

    scenario 'and Back to list rental period' do
      rental_period = create(:rental_period)
      rental_period2 = create(:rental_period, description: 'Anual')
      visit rental_period_path(rental_period)
      click_on 'Voltar'
      expect(page).to have_content rental_period.description
      expect(page).to have_content rental_period2.description
    end
  end
