class AddAgencyToJobOrders < ActiveRecord::Migration
  def change
    add_column :job_orders, :agency_profile_id, :integer
    add_index :job_orders, :agency_profile_id
  end
end
