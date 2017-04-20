require 'rails_helper'

# Acceptance Criteria
# [ ] If I am unauthenticated I should not have a profile page
# [ ] If I am an authenticated user, I want to be able to navigate to my profile page
# [ ] As an authenticated user, I want to be able to edit my profile information from my profile page
# [ ] As an authenticated user, after I have edited my profile information, I want to be able to use the new informaton to access my account
# [ ] As an authenticated user, I want to be able to change my password from my profile page

feature "user updates account" do
  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
  end

  scenario "unauthenticated user does not see link to profile page" do
    visit shows_path

    click_link "Sign out"

    expect(page).to have_content("Sign in")
    expect(page).to_not have_content("Profile")
  end

  scenario "authenticated user clicks link to profile page" do
    visit shows_path

    click_link "Profile"

    expect(page).to have_content("#{user.first_name} #{user.last_name}'s
                                  Profile'")
    expect(current_path).to eq user_path
  end

  scenario "navigates to edit
            page from profile page" do
    visit user_path

    click_link "Edit Profile"

    expect(page).to have_content "Edit Profile"
    expect(current_path).to eq edit_user_registration_path
  end

  scenario "fills in new profile details" do
    visit edit_user_registration_path

    fill_in('First Name', with: 'John')
    fill_in('Last Name', with: 'Doe')
    fill_in('Username', with: 'jdoe')
    fill_in('Password', with: 'password123')
    fill_in('Reenter Password', with: 'password123')
    fill_in('Email', with: 'jdoe@email.com')

    click_button "Save"

    expect(page).to have_content "Information updated."
  end

  scenario "fills in bad new profile details" do
    visit edit_user_registration_path

    fill_in('First Name', with: '')
    fill_in('Last Name', with: '')
    fill_in('Username', with: '')
    fill_in('Password', with: '')
    fill_in('Reenter Password', with: '')
    fill_in('Email', with: '')

    click_button "Save"

    expect(page).to have_content "Error."
  end

  scenario "logs in with new profile details" do
    visit edit_user_registration_path

    fill_in('First Name', with: 'John')
    fill_in('Last Name', with: 'Doe')
    fill_in('Username', with: 'jdoe')
    fill_in('Password', with: 'password123')
    fill_in('Reenter Password', with: 'password123')
    fill_in('Email', with: 'jdoe@email.com')

    click_button "Save"

    click_link "Sign out"
    click_link "Sign in"

    fill_in("Username", with: "jdoe")
    fill_in("Password", with: "password123")

    click_button "Sign in"

    expect(page).to have_content("Signed in successfully.")
  end

  scenario "navigates to edit password page from profile page" do
    
  end
end
