class AddGeocodeToPlace < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :lat, :double, {:precision=>9, :scale=>6} 
    add_column :places, :lng, :double, {:precision=>9, :scale=>6}  
  end
end
