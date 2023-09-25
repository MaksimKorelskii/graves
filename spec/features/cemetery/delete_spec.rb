require 'rails_helper'

feature 'User can delete cemetery', %q{
  User would like to delete the cemetery
} do
  given(:user) { create(:user) }
  given(:cemetery) { create(:cemetery, user: user) }

  scenario 'delete cemetery' do
    sign_in(user)
    visit cemetery_path(cemetery)
    click_on 'Delete'

    expect(page).to have_content 'Cemeteries'
    expect(page).to have_content 'Cemetery was successfully destroyed.'
  end
end