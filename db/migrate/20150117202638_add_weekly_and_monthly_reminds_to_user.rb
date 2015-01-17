class AddWeeklyAndMonthlyRemindsToUser < ActiveRecord::Migration
  def change
    add_column :users, :remind_weekly, :boolean, default: true
    add_column :users, :remind_monthly, :boolean, default: true
  end
end
