require "rails_helper"

feature "visitors can view shows on index page" do
  let!(:first_show) { FactoryGirl.create(:show) }
  let!(:second_show) { FactoryGirl.create(:show) }

  scenario "visitor sees all shows displayed" do
    visit root_path

    expect(page).to have_content "Must Watch TV Shows"
    expect(page).to have_content first_show.description
    expect(page).to have_content second_show.description
    expect(page).to have_link first_show.title
    expect(page).to have_link second_show.title
  end

  scenario "visitor clicks on show title" do
    visit root_path

    click_link first_show.title

    expect(current_path).to eq show_path(first_show)
  end

  scenario "visitor sees shows info displayed" do
    visit show_path(first_show)

    expect(page).to have_content first_show.title
    expect(page).to have_content first_show.description
    expect(page).to have_content first_show.average_rating

    expect(page).to_not have_content second_show.title
  end
end
