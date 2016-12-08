class AddTrackOwnerIdToTracks < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :track_owner_id, :integer
  end
end
