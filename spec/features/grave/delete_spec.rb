require 'rails_helper'

feature 'User can delete the grave', '
  User would like to delete the grave
  ' do
  given(:user) { create(:user) }
  given(:cemetery) { create(:cemetery, user:) }
  given(:grave) { create(:grave, cemetery:, user:) }

  # background do
  #   sign_in(user)
  #   visit cemetery_path(cemetery)
  #   within ".graves_table" do
  #     click_on 'Delete'
  #   end
  # end

  scenario 'delete the grave' do
    Expected pending 'No reason given'
    # expect(page).to have_content 'Grave was successfully deleted.'
    # expect(page).to have_content "#{cemetery.title}"
    # expect(page).to_not have_content "#{grave.last_name}"
  end
end
