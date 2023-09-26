# frozen_string_literal: true

require 'rails_helper'

feature 'User can log out', '
  User would like to Log out
' do
  given(:user) { create(:user) }

  background do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Login'
  end

  scenario 'Registered User tries to log out' do
    click_on 'Log out'

    expect(page).to have_content 'Signed out successfully.'
  end
end
