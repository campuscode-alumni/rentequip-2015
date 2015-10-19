require 'rails_helper'

feature 'User edit equipment' do
  scenario 'Successfully' do
    equipment = create(:equipment)

    visit edit_equipment_path(equipment.id)

    fill_in 'Nome', with: 'Furadeira de Impacto'
    fill_in 'Marca', with: 'Bosh'
    fill_in 'Fornecedor', with: 'Extra'
    fill_in 'Preço de locação', with: '23.80'
    fill_in 'Modelo', with: 'R2D2'
    fill_in 'Patrimônio', with: '123546'
    fill_in 'Data da compra', with: '05/10/2015'
    fill_in 'Preço do equipamento', with: '80.00'

    click_on 'Editar equipamento'

    expect(page).to have_content 'Furadeira de Impacto'
    expect(page).to have_content 'Bosh'
    expect(page).to have_content 'Extra'
    expect(page).to have_content 23.80
    expect(page).to have_content 'R2D2'
    expect(page).to have_content '123546'
    expect(page).to have_content '2015-10-05'
    expect(page).to have_content 80.00
  end
end
