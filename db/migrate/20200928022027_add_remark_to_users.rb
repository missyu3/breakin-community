class AddRemarkToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :remark, :text
  end
end
