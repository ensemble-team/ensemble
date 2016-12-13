class BlockSourceTypeToOwnerType < ActiveRecord::Migration[5.0]
  def change
    rename_column :blacklists, :block_source_type, :owner_type
  end
end
