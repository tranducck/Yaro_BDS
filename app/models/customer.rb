class Customer < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name, presence: true
  validates :gender, presence: true, inclusion: { in: %w(male female) }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  belongs_to :user
  has_many :customer_notes
end
