# Acceptance Criteria
# [ ] On profile page, I want to see button to delete account
# [ ] When clicked, I want an alert asking me to confirm deleting my account
# [ ] If I don't confirm, I am brought back to the profile page
# [ ] If I do confirm, I am brought back to the home page and receive a message
#     that account is deleted

feature "user deletes account" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    login_as(@user, scope: :user)
  end

  scenario "user deletes account from profile page" do
    visit edit_user_registration_path

    click_button "Cancel my account"

    expect(page).to have_content("Bye! Your account has been successfully
                                  cancelled. We hope to see you again soon.")
  end
end
