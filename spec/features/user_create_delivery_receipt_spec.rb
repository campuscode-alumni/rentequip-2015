require 'rails_helper'
feature 'Create delivery receipt' do
  scenario 'successfully' do
    contract = create(:contract)

    visit contract_path(contract)

    click_on 'Gerar Recibo de Entrega'

    expect(page).to have_content("Eu, #{contract.customer.name},")
    expect(page).to have_content("inscrito sob o CPF #{contract.customer.cpf}")
    expect(page).to have_content('declaro ter recebido os equipamentos abaixo')
    expect(page).to have_content("no endereço #{contract.delivery_address},")
    expect(page).to have_content("de acordo com o contrato emitido em
                                  #{contract.created_at},")
    expect(page).to have_content("pelo período de:
                                  #{contract.rental_period.period} dias.")
    contract.equipment.each do |e|
      expect(page).to have_content(e.to_s)
    end
    expect(page).to have_content("São Paulo,
                                  #{Time.zone.now.to_s(:written_date)}")
  end
end
