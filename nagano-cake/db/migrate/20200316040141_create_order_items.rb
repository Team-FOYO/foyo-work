class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :unit_price
      t.integer :quantity
      t.integer :status
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
