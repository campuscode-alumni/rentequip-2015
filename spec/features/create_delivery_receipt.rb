require 'rails_helper'
feature 'Create delivery receipt' do
  scenario 'successfully' do
    contract = create(:contract)

    visit contract_path(contract)

    click_on 'Gerar Recibo de Entrega'

    expect(page).to have_content('Recibo de Entrega #1')
    expect(page).to have_content(contract.id)
    expect(page).to have_content(contract.total_value)
    expect(page).to have_content(equipment)
    expect(page).to have_content('Locadora Campus Code')
    expect(page).to have_content(contract.customer.name)
    expect(page).to have_content(contract.customer.address)
    expect(page).to have_content(contract.delivery_address)

  end
end
