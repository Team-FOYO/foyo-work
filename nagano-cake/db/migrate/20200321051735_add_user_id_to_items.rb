class AddUserIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :image_id, :string
  end
end
