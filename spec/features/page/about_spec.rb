# frozen_string_literal: true

require 'rails_helper'

feature 'User can read information about web-service', '
User would like to get info about web-service
' do
  given(:user) { create(:user) }

  scenario 'Authenticated user' do
    sign_in(user)
    visit root_path

    expect(page).to have_content "Welcome, #{user.name}"
    expect(page).to have_content 'That is web-service as Russian analog Billion Graves'
  end

  scenario 'Unauthenticated user' do
    visit root_path

    expect(page).to have_content 'Welcome, Guest'
    expect(page).to have_content 'That is web-service as Russian analog Billion Graves'
  end
end
