class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum:255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false}
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :status, inclusion: { in: %w(active trial inactive) }
  VALID_PHONE_REGEX = /[0-9]/
  validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }

  has_secure_password

  has_many :customers
  has_many :brands
end
