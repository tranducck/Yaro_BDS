class CustomerNote < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :customer
end
