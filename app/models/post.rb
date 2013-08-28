class Post < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  def self.from_followed_users(user)
		where("user_id IN (SELECT to_id FROM followings WHERE from_id = :user_id) OR user_id = :user_id", user_id: user.id)
  end
end
