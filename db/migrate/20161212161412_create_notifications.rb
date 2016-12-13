class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :notification_owner_type
      t.integer :notification_owner_id
      t.integer :notified_by
      t.boolean :read
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
