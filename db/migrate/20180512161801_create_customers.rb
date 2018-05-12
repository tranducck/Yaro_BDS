class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.date :dob
      t.string :relation
      t.string :gender
      t.string :email
      t.string :phone
      t.integer :brand_id
      t.integer :user_id

      t.timestamps
    end
  end
end
