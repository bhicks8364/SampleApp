class AddWeekToShifts < ActiveRecord::Migration
  def change
    remove_column :shifts, :week
    add_column :shifts, :week, :integer, index: true
  end
end
