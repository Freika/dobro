class UserMailer < ApplicationMailer
  def daily_remind(user)
    @user = user
    mail(to: @user, subject: 'Daily remind')
  end
end
