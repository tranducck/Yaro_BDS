class CreateAhoyMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :ahoy_messages do |t|
      t.string :token

      # user
      t.text :to
      t.references :user, polymorphic: true

      # optional - feel free to remove
      t.string :mailer
      t.text :subject
      # t.text :content

      # optional
      # t.string :utm_source
      # t.string :utm_medium
      # t.string :utm_term
      # t.string :utm_content
      # t.string :utm_campaign

      # timestamps
      t.timestamp :sent_at
      t.timestamp :opened_at
      t.timestamp :clicked_at
    end

    add_index :ahoy_messages, [:token]
  end
end
