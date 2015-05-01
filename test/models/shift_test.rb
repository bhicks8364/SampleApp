# == Schema Information
#
# Table name: shifts
#
#  id            :integer          not null, primary key
#  assignment_id :integer
#  hours_worked  :decimal(, )
#  time_in       :datetime
#  time_out      :datetime
#  state         :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  timesheet_id  :integer
#  week          :integer
#
# Indexes
#
#  index_shifts_on_assignment_id  (assignment_id)
#  index_shifts_on_state          (state)
#

require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
