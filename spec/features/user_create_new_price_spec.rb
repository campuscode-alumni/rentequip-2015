require 'rails_helper'

feature "User create prices" do
  scenario "successfuly" do

    visit new_price_path

    fill_in 'Equipment', with: 'Betoneira'
    select('3 dias', :from => 'Time')
    fill_in 'Total', with: '150.00'

    click_on 'Salvar Preço'

    expect(page).to have_content 'Betoneira'
    expect(page).to have_content '3 dias'
    expect(page).to have_content '150.0'
  end
end
