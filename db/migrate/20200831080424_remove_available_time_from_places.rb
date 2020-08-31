class RemoveAvailableTimeFromPlaces < ActiveRecord::Migration[6.0]
  def change
    remove_column :places, :available_time, :time
  end
end
