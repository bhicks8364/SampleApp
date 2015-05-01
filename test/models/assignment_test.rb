# == Schema Information
#
# Table name: assignments
#
#  id                  :integer          not null, primary key
#  employee_profile_id :integer
#  job_order_id        :integer
#  pay_rate            :decimal(, )
#  bill_rate           :decimal(, )
#  created_at          :datetime
#  updated_at          :datetime
#  state               :string(255)
#
# Indexes
#
#  index_assignments_on_employee_profile_id  (employee_profile_id)
#  index_assignments_on_job_order_id         (job_order_id)
#  index_assignments_on_state                (state)
#

require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
