class AddAvatarsToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :avatars, :json
  end
end
