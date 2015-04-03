# == Schema Information
#
# Table name: employee_profiles
#
#  id             :integer          not null, primary key
#  ssn            :string(255)
#  w2_box5        :integer
#  marital_status :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  employee_name  :string(255)
#

require 'test_helper'

class EmployeeProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
