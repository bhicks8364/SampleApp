class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.belongs_to :assignment, index: true
      t.date :week
      t.decimal :hours_worked
      t.datetime :time_in
      t.datetime :time_out
      t.string :state

      t.timestamps
    end
  end
end
