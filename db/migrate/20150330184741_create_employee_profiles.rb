class CreateEmployeeProfiles < ActiveRecord::Migration
  def change
    create_table :employee_profiles do |t|
      t.string :ssn
      t.integer :w2_box5
      t.string :marital_status

      t.timestamps
    end
  end
end
