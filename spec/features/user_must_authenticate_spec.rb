require 'rails_helper'

feature 'User must autenthicate' do
  scenario 'visit login successfully' do

    visit root_path

    expect(current_path).to eq(new_user_session_path)
  end

  scenario 'logon successfully' do

    visit root_path

    user = create(:user)

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.encrypted_password
    click_on 'Log in'

    expect(page).to have_content 'Sucesso!'
    expect(current_path).to eq(root_path)
  end

  scenario 'logon unsuccessfully' do
    visit root_path

    click_on 'Entrar'

    expect(page).to have_content('Por favor, insira o usuário e a senha.')
  end
end
