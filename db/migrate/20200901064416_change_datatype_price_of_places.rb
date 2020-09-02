class ChangeDatatypePriceOfPlaces < ActiveRecord::Migration[6.0]
  def change
    change_column :places, :price, :string
  end
end
