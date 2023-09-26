require 'rails_helper'

feature 'User can edit the grave', %q{
  user would like to edit the grave
} do
  given(:user) { create(:user) }
  given(:cemetery) { create(:cemetery, user: user) }
  given(:grave) { create(:grave, cemetery: cemetery, user: user) }

  background do
    sign_in(user)
    visit cemetery_path(cemetery)
    # within ".graves_table" do
    click_on 'Edit grave'
    # end
  end

  scenario 'edit the grave with valid data' do
    fill_in 'Last name', with: 'updated'
    click_on 'Submit Grave!'

    expect(page).to have_content 'Grave was successfully updated.'
    expect(page).to have_content "#{cemetery.title}"
    expect(page).to have_content 'updated'
  end
end