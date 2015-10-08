require "rails_helper"

feature "Create Rental Period" do
  scenario "successfully" do
    visit new_rental_period_path

    rental_equipment = RentalEquipment.new

    fill_in 'Descrição', with: 'Furadeida de médio porte'
    fill_in 'Prazo em dias', with: 20
    click_on 'Cadastrar período de locação'

    expect(page).to have_content 'Furadeida de médio porte'
    expect(page).to have_content '20'
  end
end
