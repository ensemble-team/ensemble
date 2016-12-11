class AddBlockSourceTypeToBlacklists < ActiveRecord::Migration[5.0]
  def change
    add_column :blacklists, :block_source_type, :string
  end
end
