class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.belongs_to :assignment, index: true
      t.integer :week
      t.string :state
      t.decimal :reg_hours
      t.decimal :ot_hours
      t.decimal :gross_pay
      t.decimal :gross_bill

      t.timestamps
    end
  end
end
