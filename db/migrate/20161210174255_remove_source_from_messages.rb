class RemoveSourceFromMessages < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :source, :integer
  end
end
