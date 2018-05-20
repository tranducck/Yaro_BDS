class CustomerEmail < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  belongs_to :customer
  belongs_to :project
end
