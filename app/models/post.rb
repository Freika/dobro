class Post < ActiveRecord::Base
  belongs_to :user
  validates :status, inclusion: { in: %w(daily weekly monthly yearly summer winter spring autumn) }
end
