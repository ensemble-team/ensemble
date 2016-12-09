class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :requests, :branches_id, :branch_id
  end
end
