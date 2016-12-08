class CreateBranches < ActiveRecord::Migration[5.0]
  def change
    create_table :branches do |t|
      t.string :title
      t.string :instrument
      t.text :description
      t.integer :project_id
      t.integer :user_id
      t.timestamps
    end
  end
end
