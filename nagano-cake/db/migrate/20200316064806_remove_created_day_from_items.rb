class RemoveCreatedDayFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :created_day, :datetime
  end
end
