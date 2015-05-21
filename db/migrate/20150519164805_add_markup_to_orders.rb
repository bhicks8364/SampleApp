class AddMarkupToOrders < ActiveRecord::Migration
  def change
    remove_column :job_orders, :est_pay
    remove_column :job_orders, :est_bill
    add_column :job_orders, :mark_up, :decimal
    add_column :job_orders, :min_pay, :decimal
    add_column :job_orders, :max_pay, :decimal
    add_column :job_orders, :max_bill, :decimal
    add_column :job_orders, :desired_mark_up, :decimal
    add_column :assignments, :recruiter_id, :integer
    add_column :timesheets, :approved_by, :integer
    add_column :timesheets, :approved_at, :datetime

  end
end
