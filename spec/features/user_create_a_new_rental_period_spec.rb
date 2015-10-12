require "rails_helper"

feature "Create Rental Period" do
  scenario "successfully" do
    visit new_rental_period_path

    rental_period = build(:rental_period)

    fill_in 'Descrição', with: rental_period.description
    fill_in 'Prazo em dias', with: rental_period.period

    click_button 'Cadastrar período de locação'

    expect(page).to have_content rental_period.description
    expect(page).to have_content rental_period.period
  end
end
