class CommentOwnerTypeToOwnerType < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :comment_owner_type, :owner_type
  end
end
