# frozen_string_literal: true

require 'rails_helper'

feature 'User can create Cemetery', '
  User would like to create Cemetery
  as an authenticated user
  in order watch cemeteries
' do
  given(:user) { create(:user) }

  describe 'Authenticated user' do
    background do
      sign_in(user)
      visit cemeteries_path
      click_on 'New cemetery'
    end

    scenario 'create a Cemetery' do
      fill_in 'Title', with: 'Cemetery Test'
      fill_in 'Description', with: 'Test Description'
      click_on 'Submit cemetery!'

      expect(page).to have_content 'Cemetery was successfully created.'
      expect(page).to have_content 'Cemetery Test'
      expect(page).to have_content 'Test Description'
    end

    scenario 'create a Cemetery with errors' do
      fill_in 'Title', with: ''
      fill_in 'Description', with: ''
      click_on 'Submit cemetery!'

      expect(page).to have_content "Title can't be blank"
    end
  end

  scenario 'Unauthenticated user tries to create a Cemetery' do
    visit cemeteries_path
    click_on 'New cemetery'

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
