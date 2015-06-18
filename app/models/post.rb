class Post < ActiveRecord::Base
  has_many :comments
  validates_uniqueness_of :title
  validates_uniqueness_of :body
end
