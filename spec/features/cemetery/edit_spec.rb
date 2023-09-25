require 'rails_helper'

feature 'User can edit cemetery', %q{
  User would like to edit cemetery
} do
  given(:user) { create(:user) }
  given(:cemetery) { create(:cemetery, user: user) }

  background do
    sign_in(user)
    visit cemetery_path(cemetery)
    click_on 'Edit'
  end

  scenario 'edits cemetery' do
    fill_in 'Title', with: 'Title updated'
    fill_in 'Description', with: 'Description updated'
    click_on 'Submit cemetery!'

    expect(page).to have_content 'Cemetery was successfully updated.'
    expect(page).to have_content 'Title updated'
    expect(page).to have_content 'Description updated'
  end

  scenario 'edit cemetery with invalid title' do
    fill_in 'Title', with: ''
    fill_in 'Description', with: 'Description updated'
    click_on 'Submit cemetery!'

    expect(page).to have_content "Title can't be blank"
  end
end
