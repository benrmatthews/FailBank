class Fail < ActiveRecord::Base
  attr_accessible :description, :lesson, :name, :user_id, :tag_list
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :comments, as: :commentable
  
  include Tire::Model::Search
  include Tire::Model::Callbacks

  belongs_to :user

  validates :user_id, presence: true

  default_scope order: 'fails.created_at DESC'
    
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
  
  def self.tagged_with(name)
    Tag.find_by_name!(name).fails
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.id) as count").
      joins(:taggings).group("tags.id")
  end
  
  def tag_list
    tags.map(&:name).join(", ")
  end
  
  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
  
  def self.search(params)
    tire.search(load: true) do
      query { string params[:query]} if params[:query].present?
      filter :range, published_at: {lte: Time.zone.now }
    end
  end
  
    # Returns fails from the users being followed by the given user.
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
end
