# frozen_string_literal: true

require 'rails_helper'

feature 'User can create the grave', '
  User would like to create the grave
' do
  given(:user) { create(:user) }
  given(:cemetery) { create(:cemetery, user:) }

  background do
    sign_in(user)
    visit cemetery_path(cemetery)
  end

  scenario 'create the grave with valid data' do
    fill_in 'Last name', with: 'Smith'
    click_on 'Submit Grave!'

    expect(page).to have_content 'Grave was successfully created.'
    expect(page).to have_content 'Smith'
  end

  scenario 'create the grave with invalid data' do
    fill_in 'Last name', with: ''
    click_on 'Submit Grave!'

    expect(page).to have_content "Last name can't be blank"
  end
end
