class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.string :title
      t.text :text
      t.string :avatar
      t.integer :track_id
      t.string :track_owner_type
      t.integer :user_id

      t.timestamps
    end
  end
end
