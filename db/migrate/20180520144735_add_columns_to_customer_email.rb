class AddColumnsToCustomerEmail < ActiveRecord::Migration[5.1]
  def change
    add_column :customer_emails, :project_id, :integer
    add_column :customer_emails, :open_count, :integer
    add_column :customer_emails, :click_count, :integer
    add_column :customer_emails, :title, :string
  end
end
