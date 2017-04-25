require 'rails_helper'

# Acceptance Criteria
# [ ] I want to see a button to delete a favorite from the index page
# [ ] I want to delete a favorite from my user page when I click on this button
# [ ] Once I have deleteed a favorite, I want to be redirected to the same page

feature "user deletes a favorite" do

  before(:each) do
    @user = FactoryGirl.create(:user)
    login_as(@user, scope: :user)

    @game_of_thrones = Show.create(
      title: 'Game of Thrones',
      description: 'awesome HBO show',
      average_rating: 5
    )

    visit root_path

    click_link "Add to Favorites"
  end

  scenario "sees and clicks on Remove from Favorites button from index page" do

    visit root_path

    click_link "Remove from Favorites"

    expect(page).to have_content("This show has been deleted from favorites.")

    expect(current_path).to eq "/"
  end

  scenario "sees and clicks on Remove from Favorites button from show page" do

    visit show_path(@game_of_thrones)

    click_link "Remove from Favorites"

    expect(page).to have_content("This show has been deleted from favorites.")

    expect(current_path).to eq "/shows/#{@game_of_thrones.id}"
  end

  scenario "does not see favorites link after signing out on index page" do

    logout(:user)

    visit root_path

    expect(page).to_not have_content("Add to Favorites")
    expect(page).to_not have_content("Remove from Favorites")
    expect(page).to have_content("Sign in")
    expect(page).to have_content("Create Account")
    expect(current_path).to eq "/"
  end

  scenario "does not see favorites link after signing out on show page" do

    logout(:user)

    visit show_path(@game_of_thrones)

    expect(page).to_not have_content("Add to Favorites")
    expect(page).to_not have_content("Remove from Favorites")
    expect(page).to have_content("awesome HBO show")
    expect(page).to have_content("Sign in")
    expect(page).to have_content("Create Account")
    expect(current_path).to eq "/shows/#{@game_of_thrones.id}"
  end

end
