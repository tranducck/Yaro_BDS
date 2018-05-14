class Project < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :investor, presence: true
  validates :constructor, presence:true

  has_attached_file :logo
  validates_attachment :logo, presence: true,
    size: { in: 0..5.megabytes }
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
end
