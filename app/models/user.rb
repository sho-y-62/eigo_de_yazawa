class User < ApplicationRecord
  has_secure_password
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }

  # REGEX = Regular expression
  # To validate correct email structure
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                                    format: { with: EMAIL_REGEX },
                                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, allow_nil: true
end
