class CreateUserPlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :user_places do |t|
      t.references :user, null: false, foreign_key: true
      t.references :place, null: false, foreign_key: true
      t.timestamps
    end
  end
end
