require 'rails_helper'

feature 'User visits root path' do
  scenario 'successfully' do

    visit root_path

    expect(page).to have_content('CONTRATOS')

  end
end
