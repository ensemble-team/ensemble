class RemoveTrackIdFromTracks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tracks, :track_id, :integer
  end
end
