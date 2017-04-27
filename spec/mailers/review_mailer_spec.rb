require "rails_helper"

RSpec.describe ReviewMailer, type: :mailer do
  describe "send vote email" do
    let(:user) { FactoryGirl.create(:user) }
    let(:mail) { ReviewMailer.review_email(user) }

    it "renders the correct headers" do
      expect(mail.subject).to eq "Someone voted on your review"
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["notifications@tvalacarte.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to have_text("Hello from TV a la Carte")
    end
  end
end
