class UserMailer < ApplicationMailer
  def daily_remind(user)
    @user = user
    mail(to: @user.email, subject: 'Daily remind')
  end
end
