class CreateBrands < ActiveRecord::Migration[5.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :hot_line
      t.text :info
      t.integer :user_id

      t.timestamps
    end
  end
end
