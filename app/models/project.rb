class Project < ApplicationRecord
  before_create :create_code

  validates :name, presence: true
  validates :address, presence: true
  validates :investor, presence: true
  validates :constructor, presence:true

  has_attached_file :logo
  validates_attachment_content_type :logo, content_type: ['image/jpeg', 'image/png', 'image/gif', 'application/pdf']

  private

    def create_code
      self.code = SecureRandom.urlsafe_base64
    end
end
