require 'rails_helper'

RSpec.describe Show, type: :model do
  it { should have_valid(:title).when("Bruce") }
  it { should_not have_valid(:title).when(nil, "") }

  it { should have_valid(:description).when("Wayne") }
  it { should_not have_valid(:description).when(nil, "") }

  it { should have_valid(:average_rating).when(5) }
  it { should_not have_valid(:average_rating).when(nil, "") }
  it { should_not have_valid(:average_rating).when(0) }
  it { should_not have_valid(:average_rating).when(6) }
  it { should_not have_valid(:average_rating).when("Rating: 5") }

  context "associations" do
    it { should have_many(:reviews) }
  end
end
