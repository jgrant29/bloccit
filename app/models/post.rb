class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  default_scope { order('created_at DESC') }
  validates_uniqueness_of :title
  validates_uniqueness_of :body
end
