class RequestOwnerTypeToOwnerType < ActiveRecord::Migration[5.0]
  def change
    rename_column :requests, :request_owner_type, :owner_type
  end
end
