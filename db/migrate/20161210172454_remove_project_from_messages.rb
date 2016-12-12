class RemoveProjectFromMessages < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :project, :integer
  end
end
