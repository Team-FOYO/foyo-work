class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def up
  	change_column :users, :first_name, :string
  end

  def down
  	change_column :users, :first_name, :string,null: false
  end
end
