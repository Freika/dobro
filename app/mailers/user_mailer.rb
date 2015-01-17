class UserMailer < ApplicationMailer
  def daily_remind(user)
    @user = user
    mail(to: @user.email, subject: 'Ежедневное напоминание от дневника')
  end

  def weekly_remind(user)
    @user = user
    mail(to: @user.email, subject: 'Не забудь подвести итоги недели!')
  end

  def monthly_remind(user)
    @user = user
    mail(to: @user.email, subject: 'Не забудь подвести итоги месяца!')
  end
end
