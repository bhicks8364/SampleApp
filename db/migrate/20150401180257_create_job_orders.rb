class CreateJobOrders < ActiveRecord::Migration
  def change
    create_table :job_orders do |t|
      t.string :job_title
      t.text :job_description
      t.boolean :active, default: true
      t.belongs_to :company_profile, index: true
      t.date :fill_date

      t.timestamps
    end
  end
end
