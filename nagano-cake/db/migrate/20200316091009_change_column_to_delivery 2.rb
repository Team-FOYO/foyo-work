class ChangeColumnToDelivery < ActiveRecord::Migration[5.2]
  def change
  	change_column :orders, :user_id, :integer,null: false
	change_column :orders, :postal_code, :integer,null: false
  	change_column :orders, :address, :text,null: false
  	change_column :orders, :addressee, :string,null: false
  end
end
