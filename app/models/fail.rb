class Fail < ActiveRecord::Base
  attr_accessible :description, :lesson, :name, :user_id
  has_many :comments, as: :commentable
  
  belongs_to :user
  
  validates :user_id, presence: true
  
  default_scope order: 'fails.created_at DESC'
end
