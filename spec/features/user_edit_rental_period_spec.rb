require 'rails_helper'
feature 'User edit rental period' do
  scenario 'successfully' do
    rental_period = create(:rental_period)
    visit edit_rental_period_path(rental_period)
    fill_in 'Descrição', with: 'Anual'
    fill_in 'Período em dias', with: '1'
    click_button 'Editar período de locação'
    expect(page).to have_content 'Anual'
    expect(page).to have_content '1'
  end

  scenario 'using empty data' do
    rental_period = create(:rental_period)
    visit edit_rental_period_path(rental_period)
    fill_in 'Descrição', with: ''
    fill_in 'Período em dias', with: ''
    click_button 'Editar período de locação'
    expect(page).to have_content 'Atenção! Todos os campos são obrigatórios'
  end

  scenario 'using invalid period' do
    rental_period = create(:rental_period)
    visit edit_rental_period_path(rental_period)
    fill_in 'Descrição', with: 'Anual'
    fill_in 'Período em dias', with: 'teste'
    click_button 'Editar período de locação'
    expect(page).to have_content 'Campo aceita apenas inteiros!'
  end
end
