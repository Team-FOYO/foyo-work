class ChangeColumnToOrder < ActiveRecord::Migration[5.2]
  def change
  	  	change_column :orders, :user_id, :integer,null: false
change_column :orders, :payment, :integer,null: false, default: "0"
  	change_column :orders, :postal_code, :string,null: false
  	change_column :orders, :address, :text,null: false
  	change_column :orders, :addressee, :string,null: false
  	change_column :orders, :delivery_charge, :integer,null: false
  	change_column :orders, :status, :integer,null: false, default: "0"
  	change_column :orders, :charge, :integer,null: false
  end
end
