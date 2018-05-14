class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :address
      t.string :investor
      t.string :constructor
      t.text :info

      t.timestamps
    end
  end
end
