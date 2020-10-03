class AddDanceLevelToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :dance_level_id, :integer
  end
end
