require 'rails_helper'
# Acceptance Criteria
# [ ] As an administrator, when I click a show, I can delete any review
# [ ] If I delete a review, it should no longer appear on the show page
# [ ] If I am not an administrator, I should not be able to delete reviews by other users
feature "administrator deletes reviews" do

  before(:each) do
    @admin = FactoryGirl.create(:user, admin: true)
    login_as(@admin, scope: :user)

    @game_of_thrones = Show.create(
      title: 'Game of Thrones',
      description: 'awesome HBO show',
      average_rating: 5
      )
    @review_for_thrones = Review.create(
    title: "The deaths hit you right in the feels",
    description: "Hodor", rating: 5, show: @game_of_thrones, user: @admin
    )
  end

  scenario "sees Delete button for reviews from show page" do
    visit edit_show_review_path(@game_of_thrones, @review_for_thrones)

    find_button("Delete").visible?
  end

  scenario "user is not able to delete reviews of other users" do

    logout(@admin)

    @user = FactoryGirl.create(:user)
    login_as(@user)

    visit edit_show_review_path(@game_of_thrones, @review_for_thrones)

    expect(page).to_not have_button "Delete"

  end
end
