class ReviewMailer < ActionMailer::Base
  default from: 'notifications@tvalacarte.com'

  def review_email(user)
    @user = user
    @url = 'http://tvalacarte.com/shows/:id'
    mail(to: @user.email, subject: 'Someone voted on your review')
  end
end
