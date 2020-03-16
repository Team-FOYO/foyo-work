class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :description
      t.integer :image_id
      t.integer :no_tax
      t.boolean :is_active
      t.datetime :created_day
      t.datetime :updated_day
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
