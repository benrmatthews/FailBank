class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :fail
  # attr_accessible :title, :body
end
