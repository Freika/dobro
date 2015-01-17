namespace :user_mailer do
  desc "Remind users to write post today"
  task daily_remind: :environment do
    User.daily_reminds_enabled.each do |user|
      UserMailer.daily_remind(user).deliver_now
    end
  end

  desc "Remind users to write weekly post"
  task weekly_remind: :environment do
    User.weekly_reminds_enabled.each do |user|
      UserMailer.weekly_remind(user).deliver_now
    end
  end

  desc "Remind users to write monthly post"
  task monthly_remind: :environment do
    User.monthly_reminds_enabled.each do |user|
      UserMailer.monthly_remind(user).deliver_now
    end
  end

end
