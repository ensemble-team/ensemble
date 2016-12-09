class CreateCollaborations < ActiveRecord::Migration[5.0]
  def change
    create_table :collaborations do |t|
      t.integer :collaborator
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
