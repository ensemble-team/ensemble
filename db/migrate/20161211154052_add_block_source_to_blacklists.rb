class AddBlockSourceToBlacklists < ActiveRecord::Migration[5.0]
  def change
    add_column :blacklists, :block_source, :integer
  end
end
