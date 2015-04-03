class AddTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_type, :string
    add_column :users, :profile_id, :string
  end
end
