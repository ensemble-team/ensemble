class AddAvatarToTracks < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :avatar, :string
  end
end
