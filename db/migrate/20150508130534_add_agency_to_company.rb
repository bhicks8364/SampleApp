class AddAgencyToCompany < ActiveRecord::Migration
  def change
    add_column :job_orders, :est_pay, :decimal
    add_column :job_orders, :est_bill, :decimal
    add_column :job_orders, :acct_manager_id, :integer
    add_column :job_orders, :type, :string
    add_index :job_orders, :acct_manager_id

  end
end
