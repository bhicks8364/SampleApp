class AddProfileToUsers < ActiveRecord::Migration
  def change
    add_index :users, [:profile_id, :profile_type]
  end
end
