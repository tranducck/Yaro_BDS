class CreateCustomerNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_notes do |t|
      t.string :title
      t.text :content
      t.integer :customer_id

      t.timestamps
    end
  end
end
