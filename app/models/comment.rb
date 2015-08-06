class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  mount_uploader :avatar, AvatarUploader

  validates :body, length: { minimum: 5 }, presence: true
  validates :post, presence: true
  validates :user, presence: true

  after_create :send_favorite_emails

  private

  def send_favortie_emails
    post.favorites.each do |favorite|
      FavoriteMailer.new_comment(favorite.user, post, self).deliver_now
    end
  end
end
