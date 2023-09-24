require 'rails_helper'

feature 'User can sign up', %q{
  User would like sign up
} do

  background { visit new_user_registration_path }

  scenario 'User tries to sign up with valid params' do
    fill_in 'Email', with: 'valid@example.com'
    fill_in 'Password', with: 'valid_password'
    fill_in 'Password confirmation', with: 'valid_password'
    click_on 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully'
  end

  scenario 'User tries to sign up with invalid params 
            (Password confirmation does not match Password)' do
    fill_in 'Email', with: 'valid@example.com'
    fill_in 'Password', with: 'valid_password'
    fill_in 'Password confirmation', with: 'invalid_password'
    click_on 'Sign up'

    expect(page).to have_content "Password confirmation doesn't match Password"
  end

  scenario 'User tries to sign up with invalid email' do
    fill_in 'Email', with: 'valid_example.com'
    fill_in 'Password', with: 'valid_password'
    fill_in 'Password confirmation', with: 'valid_password'
    click_on 'Sign up'

    expect(page).to have_content 'Email is invalid'
  end

  scenario 'User tries to sign up with short password' do
    fill_in 'Email', with: 'valid@example.com'
    fill_in 'Password', with: 't'
    fill_in 'Password confirmation', with: 't'
    click_on 'Sign up'

    expect(page).to have_content 'Password is too short (minimum is 6 characters)'
  end

end