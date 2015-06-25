class Question < ActiveRecord::Base
  has_many :answers
  validates_uniqueness_of :title
  validates_uniqueness_of :body
end
