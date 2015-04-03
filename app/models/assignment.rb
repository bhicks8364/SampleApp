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
#
# Indexes
#
#  index_assignments_on_employee_profile_id  (employee_profile_id)
#  index_assignments_on_job_order_id         (job_order_id)
#

class Assignment < ActiveRecord::Base
  belongs_to :employee_profile
  belongs_to :job_order
  has_many :shifts

  accepts_nested_attributes_for :employee_profile
  accepts_nested_attributes_for :job_order
  accepts_nested_attributes_for :shifts
end
