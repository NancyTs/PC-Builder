class AddUserIdToComputers < ActiveRecord::Migration[6.1]
  def change
    add_column :computers, :user_id, :integer
    add_index :computers, :user_id
  end
end
