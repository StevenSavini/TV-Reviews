require "rails_helper"

feature "visitor sees list of reviews on show page" do
  scenario "does not see other reviews for other shows" do
    user = FactoryGirl.create(:user)

    game_of_thrones = Show.create(
      title: "Game of Thrones", description: "awesome HBO show",
      average_rating: 5
    )

    rock_bottom = Show.create(
      title: "Rock Bottom", description: "Beach streer", average_rating: 4
    )

    review_for_thrones = Review.create(
      title: "The deaths hit you right in the feels",
      description: "Hodor", rating: 5, show: game_of_thrones, user: user
    )

    review_for_rock = Review.create(
      title: "Just don't",
      description: "watch this", rating: 2, show: rock_bottom, user: user
    )

    visit show_path(rock_bottom)

    expect(page).not_to have_content game_of_thrones.title
    expect(page).not_to have_content review_for_thrones.description
  end

end
