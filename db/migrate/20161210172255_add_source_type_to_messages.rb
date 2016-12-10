class AddSourceTypeToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :source_type, :string
  end
end
