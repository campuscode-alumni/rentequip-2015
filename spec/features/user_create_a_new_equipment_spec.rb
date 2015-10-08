require "rails_helper"

feature "Create Equipment" do
  scenario "successfully" do

    visit new_equipment_path

    equipment = Equipment.new

    fill_in 'Nome', with: 'Furadeira'
    fill_in 'Marca', with: 'Bosh'
    fill_in 'Fornecedor', with: 'Extra'
    fill_in 'Preço de locação', with: '23.80'
    fill_in 'Modelo', with: 'R2D2'
    fill_in 'Patrimônio', with: '123546'
    fill_in 'Data da compra', with: '05/10/2015'
    fill_in 'Preço do equipamento', with: '80.00'

    click_button 'Cadastrar equipamento'

    expect(page).to have_content 'Furadeira'
    expect(page).to have_content 'Bosh'
    expect(page).to have_content 'Extra'
    expect(page).to have_content 23.80
    expect(page).to have_content 'R2D2'
    expect(page).to have_content '123546'
    expect(page).to have_content '2015-10-05'
    expect(page).to have_content 80.00
  end

  scenario "invalid name" do
    
    visit new_equipment_path

    equipment = Equipment.new

    fill_in 'Nome', with: ''

    click_button 'Cadastrar equipamento'

    expect(page).to have_content 'Nome é obrigatório'

  end
end
