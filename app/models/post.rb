class Post < ActiveRecord::Base
  belongs_to :user
  validates :status, inclusion: { in: %w(daily weekly monthly yearly summer winter spring autumn) }
  validates :content, presence: true
  after_save :update_streak


  def update_streak
    user = User.find(self.user_id)
    if user.posts.last.created_at.to_date == Date.today
      user.streak += 1
    else
      user.streak = 0
    end
    user.save
  end

end
