class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  scope :visible_to, -> (user) { user ? all : publicly_viewable }

  scope :publicly_viewable, -> (user) { user ? all : where(public: false) }

  scope :privately_viewable, -> (user) { user ? all : where(public: true) }

  validates :name, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 20 }, presence: true
  self.per_page = 150

# set per_page globally
  WillPaginate.per_page = 50
end
