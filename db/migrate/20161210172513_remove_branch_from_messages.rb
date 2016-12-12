class RemoveBranchFromMessages < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :branch, :integer
  end
end
