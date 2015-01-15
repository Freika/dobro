namespace :user_mailer do
  desc "Remind users to write post today"
  task daily_remind: :environment do
    User.daily_reminds_enabled.each do |user|
      UserMailer.daily_remind(user).deliver_now
    end
  end

end
