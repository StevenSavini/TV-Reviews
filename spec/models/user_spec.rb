require 'rails_helper'

RSpec.describe User, type: :model do
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
end
