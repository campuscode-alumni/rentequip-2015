require 'rails_helper'

feature 'User see all suppliers' do

  scenario 'successffuly' do
     supplier = create(:supplier)
     supplier_1 = create(:supplier)
     supplier_2 = create(:supplier)

     visit suppliers_path

     expect(page).to have_content supplier.name
     expect(page).to have_content supplier_1.name
     expect(page).to have_content supplier_2.name
  end

  scenario 'Click on name and open supplier infos' do
    supplier = create(:supplier)

    visit suppliers_path
    click_on(supplier.name)

    expect(page).to have_content supplier.name
    expect(page).to have_content supplier.cnpj
    expect(page).to have_content supplier.address
    expect(page).to have_content supplier.account_manager
    expect(page).to have_content supplier.company_name
    expect(page).to have_content supplier.email
    expect(page).to have_content supplier.phone
    expect(page).to have_content supplier.website
    expect(page).to have_content supplier.municipal_registration
    expect(page).to have_content supplier.state_registration
  end
end
