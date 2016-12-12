class CreateBlacklists < ActiveRecord::Migration[5.0]
  def change
    create_table :blacklists do |t|
      t.integer :blocked
      

      t.timestamps
    end
  end
end
