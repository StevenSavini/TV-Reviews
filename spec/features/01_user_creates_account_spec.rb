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

    click_button "Create Account"

    expect(page).to have_content("Create User Account")
    expect(current_path).to eq '/users/new'
  end

  scenario "fills in account details in form and submits details" do
    visit users_new_path

    fill_in('First Name', :with => 'John')
    fill_in('Last Name', :with => 'Doe')
    fill_in('Username', :with => 'jdoe')
    fill_in('Password', :with => 'password123')
    fill_in('Email Address', :with => 'jdoe@email.com')
    fill_in('Profile Picture URL', :with => Faker::Avatar.image)

    click_button "Submit"

    expect(page).to have_content("Account created successfully!")
    expect(current_path).to eq '/shows'
  end

  scenario "fills in bad details in form and submits details" do
    visit users_new_path

    click_button "Submit"

    expect(page).to have_content "First name can't be blank"
    expect(page).to have_content "Last name can't be blank"
    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Username can't be blank"
    expect(page).to have_content "Password can't be blank"
  end

end
