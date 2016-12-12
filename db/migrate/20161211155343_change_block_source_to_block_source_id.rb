class ChangeBlockSourceToBlockSourceId < ActiveRecord::Migration[5.0]
  def change
    rename_column :blacklists, :block_source, :block_source_id
  end
end
