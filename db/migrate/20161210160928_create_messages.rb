class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :project
      t.integer :branch
      t.integer :recipient
      t.integer :sender
      t.text :body
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
