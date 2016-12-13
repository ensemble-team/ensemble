class TrackOwnerIdToOwnerId < ActiveRecord::Migration[5.0]
  def change
    rename_column :tracks, :track_owner_id, :owner_id
  end
end
