class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
  attr_accessor :image, :image_cache, :remove_image
  mount_uploader :image, AvatarUploader
  
  has_many :reposts
end
