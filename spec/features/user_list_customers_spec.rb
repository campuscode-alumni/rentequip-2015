require 'rails_helper'

feature 'User see all customers' do
  scenario 'successfully' do
    customer = create(:customer)
    customer_1 = create(:customer, name: 'Douglas')
    customer_2 = create(:customer, name: 'João')

    visit customers_path

    expect(page).to have_content customer.name
    expect(page).to have_content customer_1.name
    expect(page).to have_content customer_2.name
  end

  scenario 'Click on name and open customer infos' do
    customer = create(:customer)

    visit customers_path
    click_on(customer.name)

    expect(page).to have_content customer.name
    expect(page).to have_content customer.cpf
    expect(page).to have_content customer.address
  end
end
