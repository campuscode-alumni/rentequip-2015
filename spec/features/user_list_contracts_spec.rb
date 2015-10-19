require 'rails_helper'

feature 'User see all contracts' do
  scenario 'successfully' do
    contrato = create(:contract)
    contrato_1 = create(:contract, payment_method: 'Boleto')
    contrato_2 = create(:contract, delivery_address: 'Alameda Santos 1293')

    visit contracts_path

    expect(page).to have_content contrato.customer.name
    expect(page).to have_content contrato_1.customer.name
    expect(page).to have_content contrato_2.customer.name
  end

  scenario 'Click on name and open contract infos' do
    contrato = create(:contract)
    devolution_date = contrato.rental_period.created_at.to_date +
      contrato.rental_period.period

    visit contracts_path

    click_on("#1 - #{contrato.customer.name}")

    expect(page).to have_content contrato.customer.name
    expect(page).to have_content contrato.delivery_address
    expect(page).to have_content contrato.payment_method
    expect(page).to have_content contrato.rental_period.description
    expect(page).to have_content devolution_date
  end
end
