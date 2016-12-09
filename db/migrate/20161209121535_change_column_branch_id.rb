class ChangeColumnBranchId < ActiveRecord::Migration[5.0]
  def change
    rename_column :requests, :branch_id, :request_owner_id
  end
end
