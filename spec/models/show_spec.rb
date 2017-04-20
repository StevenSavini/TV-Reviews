require "rails_helper"

feature "visitors can see a list of shows on homepage" do
  scenario "visitor sees shows displayed" do

    game_of_thrones = Show.create(
    title: 'Game of Thrones',
    description: 'awesome HBO show',
    average_rating: 5)
    californication = Show.create(
    title: 'Californication',
    description: 'awesome Showtime show',
    average_rating: 5)

    visit shows_path

    expect(page).to have_content "Must Watch TV Shows"
    expect(page).to have_content "Game of Thrones"
    expect(page).to have_link "Californication"
  end
end
