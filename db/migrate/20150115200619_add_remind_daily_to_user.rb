class AddRemindDailyToUser < ActiveRecord::Migration
  def change
    add_column :users, :remind_daily, :boolean, default: true
  end
end
