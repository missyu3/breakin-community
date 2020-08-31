class RemoveMainTimeFromPlaces < ActiveRecord::Migration[6.0]
  def change
    remove_column :places, :main_time, :time
  end
end
