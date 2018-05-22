class CustomerEmail < ApplicationRecord
  belongs_to :user
  belongs_to :customer
  belongs_to :project

  has_many :messages, class_name: "Ahoy::Message", as: :user
end
