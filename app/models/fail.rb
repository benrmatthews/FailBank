class Fail < ActiveRecord::Base
  attr_accessible :description, :lesson, :name, :user_id

  belongs_to :user

  validates :user_id, presence: true

  default_scope order: 'fails.created_at DESC'
  
  has_many :comments, as: :commentable
  
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
end
