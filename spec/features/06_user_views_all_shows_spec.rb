require "rails_helper"

feature "visitors can view shows on index page" do
  let!(:first_show) { FactoryGirl.create(:show) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario "visitor sees all shows displayed" do
    visit root_path

    expect(page).to have_css("img[src*='http://www.hardwickagriculture.org/blog/wp-content/uploads/placeholder.jpg']")
  end

  scenario "visitor clicks on show title" do
    visit root_path

    click_link("show-link")

    expect(current_path).to eq show_path(first_show)
  end

  scenario "visitor sees shows info displayed" do
    second_show = FactoryGirl.create(:show)
    Review.create(title: "test", description: "test", rating: 5, user: user, show: first_show )

    visit show_path(first_show)

    expect(page).to have_content first_show.title
    expect(page).to have_content first_show.description
    expect(page).to have_content first_show.average_rating

    expect(page).to_not have_content second_show.title
  end
end
