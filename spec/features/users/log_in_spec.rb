# frozen_string_literal: true

require 'rails_helper'

feature 'User can sign in', '
  User would like to Sign In
  as an authenticated user
  in order watch cemeteries
' do
  given(:user) { create(:user) }

  background { visit new_user_session_path }

  # scenario 'new Registered user tries to sign in' do
  #   User.create!(email: 'user@test.com', password: '12345678')

  #   fill_in 'Email', with: 'user@test.com'
  #   fill_in 'Password', with: '12345678'
  #   # save_and_open_page # gem launchy
  #   click_on 'Login'

  #   expect(page).to have_content 'Signed in successfully.'
  # end

  scenario 'Registered user tries to sign in' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Login'

    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'User tries to sign in with invalid params' do
    fill_in 'Email', with: 'invalid'
    fill_in 'Password', with: 'invalid'
    click_on 'Login'

    expect(page).to have_content 'Invalid Email or password.'
  end
end
