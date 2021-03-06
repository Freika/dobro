# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

every 1.day, at: '3pm' do
  rake 'user_mailer:daily_remind'
end

every :sunday, at: '3pm' do
  rake 'user_mailer:weekly_remind'
end

every '* * 25,28 * *' do
  rake 'user_mailer:monthly_remind'
end
