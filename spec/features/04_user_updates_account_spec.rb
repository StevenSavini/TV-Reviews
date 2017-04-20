require 'rails_helper'

# Acceptance Criteria
# [ ] If I am unauthenticated I should not have a profile page
# [ ] If I am an authenticated user, I want to be able to navigate to my profile page
# [ ] As an authenticated user, I want to be able to edit my profile information from my profile page
# [ ] As an authenticated user, after I have edited my profile information, I want to be able to use the new informaton to access my account
# [ ] As an authenticated user, I want to be able to change my password from my profile page

feature "user updates account" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    login_as(@user, scope: :user)
  end

  scenario "unauthenticated user does not see link to profile page" do
    visit shows_path
    expect(page).to have_content("Profile")

    click_link "Sign out"

    expect(page).to have_content("Sign in")
    expect(page).to_not have_content("Profile")
  end

  scenario "authenticated user clicks link to profile page" do
    visit shows_path

    click_link "Profile"

    expect(page).to have_content("#{@user.first_name} #{@user.last_name}'s
                                  Profile")
    expect(current_path).to eq user_path(@user)
  end

  scenario "navigates to edit
            page from profile page" do
    visit user_path(@user)

    click_link "Edit Profile"

    expect(page).to have_content "Edit User"
    expect(current_path).to eq edit_user_registration_path
  end

  scenario "fills in new profile details" do
    visit edit_user_registration_path

    fill_in('user_first_name', with: 'John')
    fill_in('user_last_name', with: 'Doe')
    fill_in('user_username', with: 'jdoe')
    fill_in('user_email', with: 'jdoe@email.com')
    fill_in('Current password', with: @user.password)

    click_button "Update"

    expect(page).to have_content "Your account has been updated successfully."
  end

  scenario "fills in bad new profile details" do
    visit edit_user_registration_path

    fill_in('user_first_name', with: '')
    fill_in('user_last_name', with: '')
    fill_in('user_username', with: '')
    fill_in('user_email', with: '')
    fill_in('Current password', with: @user.password)

    click_button "Update"

    expect(page).to have_content "4 errors prohibited this user from being saved"
  end

  scenario "logs in with new profile details" do
    visit edit_user_registration_path

    fill_in('First Name', with: 'John')
    fill_in('Last Name', with: 'Doe')
    fill_in('Username', with: 'jdoe')
    fill_in('Email', with: 'jdoe@email.com')
    fill_in("Password", with: "password123")
    fill_in("Password confirmation", with: "password123")
    fill_in('Current password', with: @user.password)

    click_button "Update"

    click_link "Sign out"
    click_link "Sign in"

    fill_in("Username", with: "jdoe")
    fill_in("Password", with: "password123")

    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
  end
end
