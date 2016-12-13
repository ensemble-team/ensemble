class NotificationOwnerTypeToOwnerType < ActiveRecord::Migration[5.0]
  def change
    rename_column :notifications, :notification_owner_type, :owner_type
  end
end
