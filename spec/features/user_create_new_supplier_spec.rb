require 'rails_helper'
feature 'User create new supplier' do
  scenario 'successfuly' do
    visit new_supplier_path
    fill_in 'supplier[name]', with: 'Sei-la Corp'
    fill_in 'supplier[address]', with: 'Alameda Santos'
    fill_in 'supplier[cnpj]', with: '123456789/0001'
    fill_in 'supplier[account_manager]', with: 'Douglas'
    fill_in 'supplier[company_name]', with: 'Sei-la Corp'
    fill_in 'supplier[email]', with: 'info@seila.com'
    fill_in 'supplier[phone]', with: '+55119547844'
    fill_in 'supplier[website]', with: 'www.seila.com'
    fill_in 'supplier[municipal_registration]', with: '1234567890'
    fill_in 'supplier[state_registration]', with: '123456789'

    click_on 'Save'
    expect(page).to have_content 'Sei-la Corp'
    expect(page).to have_content 'Alameda Santos'
    expect(page).to have_content '123456789/0001'
    expect(page).to have_content 'Douglas'
    expect(page).to have_content 'Sei-la Corp'
    expect(page).to have_content 'info@seila.com'
    expect(page).to have_content '+55119547844'
    expect(page).to have_content 'www.seila.com'
    expect(page).to have_content '1234567890'
    expect(page).to have_content '1234567890'
  end
end
