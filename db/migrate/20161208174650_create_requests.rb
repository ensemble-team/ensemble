class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer :owner_id
      t.integer :collab_id
      t.text :message
      t.string :status
      t.references :branch, foreign_key: true

      t.timestamps
    end
  end
end
