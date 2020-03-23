class ChangeColumnToOrder < ActiveRecord::Migration[5.2]
  def up
  	change_column :orders, :payment, :integer, null: true
  end

  def down
  	change_column :orders, :payment, :integer ,null: false
  end
end
