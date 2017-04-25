require "rails_helper"

# Acceptance Criteria
# [ ] Administrator navigates to user admin page
# [ ] User admin page displays list of all users with delete button
#     next to each one
# [ ] Admin clicks delete button for user and sees confirm button,
#     after which user is deleted
# [ ] Non-admin/unauthenticated user cannot navigate to page

feature "administrator reviews all users" do
  scenario "administrator navigates to Users page" do
    admin = FactoryGirl.create(:user, admin: true)
    login_as(admin)

    visit root_path

    click_link "User Admin"

    expect(page).to have_content("User Administration")
    expect(current_path).to eq users_path
  end

  scenario "admin page displays list of all users" do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    user3 = FactoryGirl.create(:user)

    admin = FactoryGirl.create(:user, admin: true)
    login_as(admin)

    visit users_path

    expect(page).to have_content(user1.username)
    expect(page).to have_content(user2.username)
    expect(page).to have_content(user3.username)
  end

  scenario "admin deletes a user" do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    user3 = FactoryGirl.create(:user)

    admin = FactoryGirl.create(:user, admin: true)
    login_as(admin)

    visit users_path

    first('.user').click_button('Delete')

    expect(page).to_not have_content(user1.username)
    expect(page).to have_content(user2.username)
    expect(page).to have_content(user3.username)

    expect(page).to have_content("User deleted.")
  end

  scenario "non-admin can't navigate to page" do
    user = FactoryGirl.create(:user)
    login_as(user)

    visit root_path

    expect(page).to_not have_content("User Admin")
  end

  scenario "unauthenticated user can't see button" do
    visit root_path

    expect(page).to_not have_content("User Admin")
  end

  scenario "non-admin user can't see user list" do
    user = FactoryGirl.create(:user)
    login_as(user)

    visit users_path

    expect(page).to have_content("Must have administrator privileges")
  end
end
