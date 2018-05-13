class AddAttachmentLogoToBrands < ActiveRecord::Migration[5.1]
  def self.up
    change_table :brands do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :brands, :logo
  end
end
