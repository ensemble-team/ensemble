class RequestOwnerIdToOwnerId < ActiveRecord::Migration[5.0]
  def change
    rename_column :requests, :request_owner_id, :receiver_id
  end
end
