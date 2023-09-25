require 'rails_helper'

feature 'User can delete your account', %q{
  User would like to delete your account
} do
  given(:user) { create(:user) }

  scenario 'Cancel account' do
    sign_in(user)
    click_on 'Edit profile'
    click_on 'Cancel my account'
    expect(page).to have_content 'Bye! Your account has been successfully cancelled. We hope to see you again soon.'
  end
end
