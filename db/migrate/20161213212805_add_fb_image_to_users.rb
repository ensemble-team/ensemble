class AddFbImageToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :fb_image, :string
  end
end
