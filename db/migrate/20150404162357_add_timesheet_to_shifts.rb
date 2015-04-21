class AddTimesheetToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :timesheet_id, :integer, index: true
  end
end
