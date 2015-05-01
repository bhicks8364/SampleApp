class AddStateToJobOrders < ActiveRecord::Migration
  def change
    add_column :job_orders, :state, :string
    add_index :job_orders, :state
    add_index :assignments, :state
    add_index :shifts, :state
    add_index :timesheets, :state
  end
end
