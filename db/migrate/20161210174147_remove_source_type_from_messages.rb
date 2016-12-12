class RemoveSourceTypeFromMessages < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :source_type, :string
  end
end
