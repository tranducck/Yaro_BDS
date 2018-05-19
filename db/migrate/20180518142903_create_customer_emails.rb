class CreateCustomerEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_emails do |t|
      t.integer :user_id
      t.integer :customer_id
      t.integer :email_template_id
      t.text :content
      t.string :status, default: "draft"

      t.timestamps
    end
  end
end
