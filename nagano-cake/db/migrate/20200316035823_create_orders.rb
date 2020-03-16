class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :payment
      t.string :postal_code
      t.text :address
      t.string :addressee
      t.integer :delivery_charge
      t.integer :charge
      t.integer :status
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
