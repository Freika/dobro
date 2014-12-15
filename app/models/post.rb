class Post < ActiveRecord::Base
  belongs_to :user
  before_save :set_status

  private

  def set_status
    if Date.today.wday == 6 || Date.today.wday == 0
      self.status = 'weekly'
    end
    if (25..31).include? Date.today.day
      self.status = 'monthly'
    end
  end
end
