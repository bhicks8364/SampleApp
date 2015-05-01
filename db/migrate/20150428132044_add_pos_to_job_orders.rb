class AddPosToJobOrders < ActiveRecord::Migration
  def change
    add_column :job_orders, :needed, :integer
    add_column :job_orders, :asap, :boolean, default: false

  end
end
