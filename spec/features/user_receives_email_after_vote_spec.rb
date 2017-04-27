require 'rails_helper'

# Acceptance Criteria
# [ ] User receives email after their review is voted on

feature "user receives email after vote" do
  let(:user) { FactoryGirl.create(:user) }
  let(:show) { FactoryGirl.create(:show) }
  let(:review) do
    Review.create(user: user, show: show, title: "Test",
                  description: "Test Desc", rating: 5)
  end

  scenario "authenticated user votes on review" do
    user2 = FactoryGirl.create(:user)
    login_as(user2, scope: :user)
    Review.create(user: user, show: show, title: "Test",
                  description: "Test Desc", rating: 5)
    visit show_path(show)

    click_link("ʌ")

    last_email = ActionMailer::Base.deliveries.last
    expect(last_email.to[0]).to eq(user.email)
  end
end
