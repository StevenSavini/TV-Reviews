require 'rails_helper'

# Acceptance Criteria
# [ ] If I am signed in, I want to see a link to sign out
# [ ] If I click link to sign out, I am logged out of app
# [ ] Once logged out of app, I see a message telling me I successfully logged and sent to home page

feature "user logs out of account" do

  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  scenario "sees and clicks on log out button from any page" do
    visit shows_path

    click_link "Sign out"

    expect(page).to have_content("Signed out successfully")
    expect(current_path).to eq '/'
    expect(page).to have_content("Sign in")
  end
end
