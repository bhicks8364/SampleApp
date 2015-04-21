# == Schema Information
#
# Table name: timesheets
#
#  id            :integer          not null, primary key
#  assignment_id :integer
#  week          :integer
#  state         :string(255)
#  reg_hours     :decimal(, )
#  ot_hours      :decimal(, )
#  gross_pay     :decimal(, )
#  gross_bill    :decimal(, )
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_timesheets_on_assignment_id  (assignment_id)
#

require 'test_helper'

class TimesheetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
