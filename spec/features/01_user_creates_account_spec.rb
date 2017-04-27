require 'rails_helper'

# Acceptance Criteria
# [ ] I want to see a button to create my account from the index page
# [ ] I want to visit a create account page when I click on this button
# [ ] I want to fill in my account details (name, username, email, and password)
# [ ] I want to get error messages if I do not fill out all required fields
# [ ] Once I have created an account, I want to be logged in

feature "user creates account" do
  scenario "sees and clicks on Create Account button from main page" do
    visit shows_path

    click_link "Create Account"

    expect(page).to have_content("Create User Account")
    expect(current_path).to eq '/users/sign_up'
    expect(page).to_not have_content("Sign out")
  end

  scenario "fills in account details in form and submits details" do
    visit new_user_registration_path

    fill_in('First Name', with: 'John')
    fill_in('Last Name', with: 'Doe')
    fill_in('Username', with: 'jdoe')
    fill_in('Password', with: 'password123')
    fill_in('Reenter Password', with: 'password123')
    fill_in('Email', with: 'jdoe@email.com')

    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(current_path).to eq '/'
    expect(page).to_not have_content("Sign in")
    expect(page).to_not have_content("Create Account")
  end

  scenario "fills in bad details in form and submits details" do
    visit new_user_registration_path

    click_button "Sign up"

    expect(page).to have_content "First name can't be blank"
    expect(page).to have_content "Last name can't be blank"
    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Username can't be blank"
    expect(page).to have_content "Password can't be blank"
  end

end
