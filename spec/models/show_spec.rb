require "rails_helper"

feature "visitors can see a list of shows on homepage" do
  scenario "visitor sees shows displayed" do

    game_of_thrones = Show.create
      (title: 'Game of Thrones',
      description: 'awesome HBO show',
      average_rating: 5)
    californication = Show.create
      (title: 'Californication',
      description: 'awesome Showtime show',
      average_rating: 5)

    visit root_path

    expect(page).to have_content "Must Watch TV Shows"
    expect(page).to have_content "awesome HBO show"
    expect(page).to have_content "awesome Showtime show"
    expect(page).to have_link "Californication"
    expect(page).to have_link "Game of Thrones"
  end
end

feature "visitors can see the shows name, description, and rating" do
  scenario "visitor sees shows info displayed" do

    game_of_thrones = Show.create
      (title: 'Game of Thrones',
      description: 'awesome HBO show',
      average_rating: 5)

    visit show_path(game_of_thrones)

    expect(page).to have_content "Game of Thrones"
    expect(page).to have_content "awesome HBO show"
    expect(page).to have_content "5"
  end
end

feature "visitors can click on show title and be redirected to show page" do
  scenario "visitor can navigate to show page" do

    game_of_thrones = Show.create
      (title: 'Game of Thrones',
      description: 'awesome HBO show',
      average_rating: 5)

    visit root_path

    click_link "Game of Thrones"

    expect(current_path).to eq show_path(game_of_thrones)
  end
end
