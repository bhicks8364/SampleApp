class AddNameToEmployeeProfiles < ActiveRecord::Migration
  def change
    add_column :employee_profiles, :employee_name, :string
  end
end
