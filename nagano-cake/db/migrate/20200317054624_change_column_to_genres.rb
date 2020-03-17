class ChangeColumnToGenres < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :genres, :is_active, from: false, to: true
  end
end
