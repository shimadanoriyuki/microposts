class User < ActiveRecord::Base
  before_save { self.email = self.email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  VALID_TEL_REGEX = /\A[0-9-]/
  validates :tel, length: {maximum:20},format: { with: VALID_TEL_REGEX }
  validates :location, length: {maximum:120}
  validates :contents, length: {maximum:600}
  has_secure_password
end
