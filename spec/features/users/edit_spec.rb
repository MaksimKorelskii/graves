require 'rails_helper'

feature 'User can edit profile', %q{
  User would like to edit profile
} do
  given(:user) { create(:user) }

    background do
      sign_in(user)
      click_on 'Edit profile'
    end
  
    scenario 'Edit profile with valid data' do
      fill_in 'Email', with: 'test@test.ru'
      fill_in 'Name', with: 'Test Name'
      fill_in 'Current password', with: user.password
      click_on 'Update'
  
      expect(page).to have_content 'Your account has been updated successfully.'
      # visit edit_user_registration_path
      # expect(page).to have_content 'test@test.ru'
      # expect(page).to have_content 'Test Name'
    end
  
    scenario 'Edit profile with invalid Email' do
      fill_in 'Email', with: 'test///1'
      fill_in 'Name', with: 'Test Name'
      fill_in 'Current password', with: user.password
      click_on 'Update'
  
      expect(page).to have_content 'Email is invalid'
    end
  end
