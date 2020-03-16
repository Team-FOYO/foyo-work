class ChangeColumnToItem < ActiveRecord::Migration[5.2]
  def change
  	change_column :items, :is_active, :boolean, null: false
  	change_column :items, :no_tax, :integer, null: false
  	change_column :items, :image_id, :integer, null: false
  	change_column :items, :name, :string, null: false
  	change_column :items, :genre_id, :integer, null: false
  	change_column :items, :description, :text, null: false
  end
end
