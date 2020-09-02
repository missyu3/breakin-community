class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :name,         null: false
      t.string :address,      null: false
      t.time :main_time,      null: false
      t.time :available_time, null: false
      t.integer :price,       null: false
      t.timestamps
    end
  end
end
