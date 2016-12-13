class TrackOwnerTypeToOwnerType < ActiveRecord::Migration[5.0]
  def change
    rename_column :tracks, :track_owner_type, :owner_type
  end
end
