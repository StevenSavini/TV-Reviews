require 'rails_helper'

# Acceptance Criteria
# [ ] I want to see a button to create my account from the index page
# [ ] I want to visit a create account page when I click on this button
# [ ] I want to fill in my account details (name, username, email, and password)
# [ ] I want to get error messages if I do not fill out all required fields
# [ ] Once I have created an account, I want to be logged in

feature "user creates review" do

  before(:each) do
    @user = FactoryGirl.create(:user)
    login_as(@user, scope: :user)
  end

  scenario "sees and clicks on Add a Review button from show page" do

    game_of_thrones = Show.create(
      title: 'Game of Thrones',
      description: 'awesome HBO show',
      average_rating: 5
                                  )

    visit show_path(game_of_thrones)

    click_link "Add a Review"

    expect(page).to have_content("Review")
    expect(current_path).to eq '/shows/1/reviews/new'
  end

  scenario "fills in review details in form and submits details" do

    game_of_thrones = Show.create(
      title: 'Game of Thrones',
      description: 'awesome HBO show',
      average_rating: 5
                                  )

    visit new_show_review_path(game_of_thrones)

    fill_in('Title', with: 'Game of Thrones')
    fill_in('Review', with: 'awesome HBO show')
    select(5, from: 'Rating')

    click_button "Add Review"

    expect(page).to have_content("Review added successfully!")
    expect(current_path).to eq '/shows/2'
    expect(page).to_not have_content("Sign in")
    expect(page).to_not have_content("Create Account")
  end

  scenario "fills in bad details in form and submits details" do
    game_of_thrones = Show.create(
      title: 'Game of Thrones',
      description: 'awesome HBO show',
      average_rating: 5
                                  )

    visit new_show_review_path(game_of_thrones)

    click_button "Add Review"

    expect(page).to have_content "Title can't be blank."
    expect(page).to have_content "Description can't be blank"
    expect(page).to_not have_content("Review added successfully!")
  end

end
