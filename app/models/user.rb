class User < ApplicationRecord
  before_save { self.email.downcase! }
  
  # 名前のバリデーション
  validates :name, presence: true, length: { maximum: 50 }
  
  # E-mailのバリデーション
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :posts
  
  
  
  # お気に入り機能

  has_many :favorites
  has_many :likes, through: :favorites, source: :post
  has_many :reverses_of_favorite, class_name: 'Favorite', foreign_key: 'post_id'
  has_many :likers, through: :reverses_of_favorite, source: :user
  
  def like(other_post)
      self.favorites.find_or_create_by(post_id: other_post.id)
  end
  
  def unlike(other_post)
    favorite = self.favorites.find_by(post_id: other_post.id)
    favorite.destroy if favorite
  end
  
  def like?(other_post)
    self.likes.include?(other_post)
  end
  
  # 一覧表示
  
  def feed_posts
    Post.all
  end
end
