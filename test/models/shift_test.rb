# == Schema Information
#
# Table name: shifts
#
#  id            :integer          not null, primary key
#  assignment_id :integer
#  week          :date
#  hours_worked  :decimal(, )
#  time_in       :datetime
#  time_out      :datetime
#  state         :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_shifts_on_assignment_id  (assignment_id)
#

require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
