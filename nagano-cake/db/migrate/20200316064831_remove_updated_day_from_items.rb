class RemoveUpdatedDayFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :updated_day, :datetime
  end
end
