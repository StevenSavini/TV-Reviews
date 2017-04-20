require "rails_helper"

feature "visitors can view shows on index page" do
  before(:each) do
    @shows_list = []
    2.times do
      @shows_list << FactoryGirl.create(:show)
    end
  end

  scenario "visitor sees all shows displayed" do
    visit root_path

    expect(page).to have_content "Must Watch TV Shows"
    expect(page).to have_content @shows_list[0].description
    expect(page).to have_content @shows_list[1].description
    expect(page).to have_link @shows_list[0].title
    expect(page).to have_link @shows_list[1].title
  end

  scenario "visitor clicks on show title" do
    visit root_path

    click_link @shows_list[0].title

    expect(current_path).to eq show_path(@shows_list[0])
  end

  scenario "visitor sees shows info displayed" do
    visit show_path(@shows_list[0])

    expect(page).to have_content @shows_list[0].title
    expect(page).to have_content @shows_list[0].description
    expect(page).to have_content @shows_list[0].average_rating

    expect(page).to_not have_content @shows_list[1].title
  end
end
