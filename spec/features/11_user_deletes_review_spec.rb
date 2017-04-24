# Acceptance Criteria
# [ ] User sees `Delete` button on TV show page
# [ ] User clicks `Delete` button on TV show page and receives
#     confirmation that review has been deleted

feature "user deletes review" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    login_as(@user, scope: :user)

    @game_of_thrones = Show.create(
      title: "Game of Thrones",
      description: "awesome HBO show", average_rating: 5
    )
    @review_for_thrones = Review.create(
      title: "The deaths hit you right in the feels",
      description: "Hodor", rating: 5, show: @game_of_thrones, user: @user
    )
  end

  scenario "authenticated user deletes own review from TV show page" do
    visit show_path(@game_of_thrones)

    click_link "Delete"

    expect(page).to have_content("Your review has been deleted")
  end

  scenario "unauthenticated user cannot see delete button on TV show page" do
    logout(:user)

    visit show_path(@game_of_thrones)

    expect(page).to_not have_button "Delete"
  end

  scenario "authenticated user cannot see delete button on other
            user's review" do
    user2 = FactoryGirl.create(:user)
    login_as(user2, scope: :user)

    visit show_path(@game_of_thrones)

    expect(page).to_not have_button "Delete"
  end
end
