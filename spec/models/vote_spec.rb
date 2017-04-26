require "rails_helper"

RSpec.describe Vote, type: :model do
  it { should have_valid(:value).when(-1) }
  it { should have_valid(:value).when(0) }
  it { should have_valid(:value).when(1) }

  it { should have_valid(:vote_value).when(true) }
  it { should have_valid(:vote_value).when(false) }

  context "associations" do
    it { should belong_to(:review) }
    it { should belong_to(:user) }
  end
end
