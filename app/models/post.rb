class Post < ApplicationRecord
  mount_uploader :picture, PictureUploader
  
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  validates :title, presence: true, length: { maximum: 255 }
end
