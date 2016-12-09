class AddRequestOwnerTypeToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :request_owner_type, :string
  end
end
