class NotificationOwnerIdToOwnerId < ActiveRecord::Migration[5.0]
  def change
    rename_column :notifications, :notification_owner_id, :owner_id
  end
end
