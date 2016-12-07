class RemoveAvatarsFromProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :avatars, :json
  end
end
