class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

default_scope { order('created_at DESC') }
scope :ordered_by_title, -> { order('title DESC') }
scope :ordered_by_reverse_order, -> { order('created_at ASC') }

  validates_uniqueness_of :title
  validates_uniqueness_of :body
end
