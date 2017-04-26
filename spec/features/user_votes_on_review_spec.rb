require 'rails_helper'

# Acceptance Criteria
# [ ] Authenticated user navigates to show page and sees reviews
# [ ] Authenticated user sees links to 'ʌ' and 'v' reviews
# [ ] If authenticated user clicks 'ʌ',
#     review votes increments by 1 and link changes to 'v'
# [ ] If authenticated user clicks 'v',
#     review votes decrements by 1 and link changes to 'ʌ'
# [ ] Unauthenticated user can see vote total but not links

feature "user votes on review" do
  let(:user) { FactoryGirl.create(:user) }
  let(:show) { FactoryGirl.create(:show) }

  scenario "authenticated user sees upvote and downvote link" do
    login_as(user, scope: :user)

    Review.create(
      title: "The deaths hit you right in the feels",
      description: "Hodor", rating: 5, show: show, user: user
    )

    visit show_path(show)

    expect(page).to have_content("ʌ")
    expect(page).to have_content("v")
  end

  scenario "authenticated user clicks upvote" do
    login_as(user, scope: :user)

    Review.create(
      title: "The deaths hit you right in the feels",
      description: "Hodor", rating: 5, show: show, user: user
    )

    visit show_path(show)

    click_link "ʌ"

    expect(page).to have_content("Review Total: 1")
  end

  scenario "authenticated user clicks downvote" do
    login_as(user, scope: :user)

    Review.create(
      title: "The deaths hit you right in the feels",
      description: "Hodor", rating: 5, show: show, user: user
    )

    visit show_path(show)

    click_link "v"

    expect(page).to have_content("Review Total: -1")
  end

  scenario "authenticated user clicks upvote twice" do
    login_as(user, scope: :user)

    Review.create(
      title: "The deaths hit you right in the feels",
      description: "Hodor", rating: 5, show: show, user: user
    )

    visit show_path(show)

    click_link "ʌ"
    click_link "ʌ"
    expect(page).to have_content("Review Total: 0")
  end

  scenario "authenticated user clicks downvote twice" do
    login_as(user, scope: :user)

    Review.create(
      title: "The deaths hit you right in the feels",
      description: "Hodor", rating: 5, show: show, user: user
    )

    visit show_path(show)

    click_link "v"
    click_link "v"

    expect(page).to have_content("Review Total: 0")
  end

  scenario "authenticated user clicks downvote after clicking upvote" do
    login_as(user, scope: :user)

    Review.create(
      title: "The deaths hit you right in the feels",
      description: "Hodor", rating: 5, show: show, user: user
    )

    visit show_path(show)

    click_link "ʌ"
    click_link "v"

    expect(page).to have_content("Review Total: 0")
  end

  scenario "unauthenticated user can't see links" do
    visit show_path(show)

    expect(page).to_not have_content("ʌ")
    expect(page).to_not have_content("v")
  end
end
