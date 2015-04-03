class AddBalanceCompanyProfiles < ActiveRecord::Migration
  def change
    add_column :company_profiles, :balance, :decimal
  end
end
