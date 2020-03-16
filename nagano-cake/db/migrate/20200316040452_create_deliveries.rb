class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :user_id
      t.integer :postal_code
      t.text :address
      t.string :addressee
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
