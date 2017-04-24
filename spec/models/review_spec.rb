require "rails_helper"

RSpec.describe Review, type: :model do
  it { should have_valid(:title).when("Bruce") }
  it { should have_valid(:title).when(nil, "") }

  it { should have_valid(:description).when("Wayne") }
  it { should have_valid(:description).when(nil, "") }

  it { should have_valid(:rating).when(5) }
  it { should_not have_valid(:rating).when(nil, "") }
  it { should_not have_valid(:rating).when(0) }
  it { should_not have_valid(:rating).when(6) }
  it { should_not have_valid(:rating).when("Rating: 5") }

  context "associations" do
    it { should belong_to(:show) }
    it { should belong_to(:user) }
  end
end
