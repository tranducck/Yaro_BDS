class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :uid
      t.string :provider
      t.string :phone
      t.string :status, default: "trial"
      t.date :expired_date

      t.timestamps
    end
  end
end
