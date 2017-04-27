require 'rails_helper'

# Acceptance Criteria
# [ ] I want to see a button to create a review from the show page
# [ ] I want to visit a create review page when I click on this button
# [ ] I want to fill in my review details (title, description, and rating)
# [ ] I want to get error messages if I do not fill out all required fields
# [ ] Once I have created a review, I want to be redirected to the show page

feature "user creates review" do

  before(:each) do
    @user = FactoryGirl.create(:user)
    login_as(@user, scope: :user)

    @game_of_thrones = Show.create(
    title: 'Game of Thrones',
    description: 'awesome HBO show',
    average_rating: 5
    )
  end

  scenario "sees and clicks on Add a Review button from show page" do

    visit show_path(@game_of_thrones)

    click_link "Add a Review"

    expect(page).to have_content("Review")

    expect(current_path).to eq "/shows/#{@game_of_thrones.id}/reviews/new"
  end
end
