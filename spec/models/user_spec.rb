require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    subject { FactoryGirl.create(:user) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  it { should have_valid(:first_name).when("Bruce") }
  it { should_not have_valid(:first_name).when(nil, "") }

  it { should have_valid(:last_name).when("Wayne") }
  it { should_not have_valid(:last_name).when(nil, "") }

  it { should have_valid(:email).when("batman@yahoo.com") }
  it { should_not have_valid(:email).when(nil, "") }

  it { should have_valid(:password).when("password123") }
  it { should_not have_valid(:password).when(nil, "") }

  it { should have_valid(:username).when("batman") }
  it { should_not have_valid(:username).when(nil, "") }

  context "associations" do
    it { should have_many(:reviews) }
  end
end
