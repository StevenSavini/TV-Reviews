require "rails_helper"

RSpec.describe Favorite, type: :model do
  context "associations" do
    it { should belong_to(:show) }
    it { should belong_to(:user) }
  end
end
