class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.belongs_to :employee_profile, index: true
      t.belongs_to :job_order, index: true
      t.decimal :pay_rate
      t.decimal :bill_rate

      t.timestamps
    end
  end
end
