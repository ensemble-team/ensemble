class AddProjectRefToTracks < ActiveRecord::Migration[5.0]
  def change
    add_reference :tracks, :project, foreign_key: true
  end
end
