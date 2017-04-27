require "rails_helper"

feature "user searches for shows" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    login_as(@user, scope: :user)

    @prison_break = Show.create(
      title: "Prison Break",
      description: "awesome Fox show", average_rating: 5
    )
  end

  scenario "sees show on page after searching" do

    visit root_path

    fill_in('search', with: 'prison')
    click_button "Search"

    expect(current_path).to eq "/shows"
    expect(page).to have_css("img[src*='http://www.hardwickagriculture.org/blog/wp-content/uploads/placeholder.jpg']")
  end

  scenario "does not see shows unrelated to search" do

    game_of_thrones = Show.create(
      title: "Game of Thrones",
      description: "awesome HBO show", average_rating: 5
    )

    visit root_path

    fill_in('search', with: 'prison')
    click_button "Search"

    expect(current_path).to eq "/shows"
    expect(page).to_not have_content game_of_thrones.title
  end

  scenario "index page is shown as is when search bar is empty" do

    game_of_thrones = Show.create(
      title: "Game of Thrones",
      description: "awesome HBO show", average_rating: 5
    )

    visit root_path

    click_button "Search"

    expect(current_path).to eq "/shows"
    expect(page).to have_css("img[src*='http://www.hardwickagriculture.org/blog/wp-content/uploads/placeholder.jpg']")
  end

end
