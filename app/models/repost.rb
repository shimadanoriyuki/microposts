class Repost < ActiveRecord::Base
  belongs_to :user
  belongs_to :micropost
  validates :user_id, presence: true
  validates :micropost_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
  mount_uploader :image, AvatarUploader
end
