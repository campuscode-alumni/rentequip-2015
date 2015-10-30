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
    expect(page).to have_content("de acordo com o contrato emitido em #{contract.created_at},")
    expect(page).to have_content("pelo período de #{contract.rental_period.description}:")
    contract.equipment.each do |e|
      expect(page).to have_content(e.to_s)
    end
    expect(page).to have_content("São Paulo, #{Time.now.to_s(:written_date)}")

  end
end
#Eu, (nome do cliente), inscrito sob o CPF (cpf), declaro ter recebido os equipamentos abaixo no endereço (endereco de entrega),
#de acordo com o contrato emitido em (data de criacao), pelo período de (prazo de locação):

  #  (nome do equipamento), (marca), patrimônio (numero de patrimonio)

#São Paulo, (dia) de (mês) de (ano)
