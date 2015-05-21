# == Schema Information
#
# Table name: job_orders
#
#  id                 :integer          not null, primary key
#  job_title          :string(255)
#  job_description    :text
#  active             :boolean          default(TRUE)
#  company_profile_id :integer
#  fill_date          :date
#  created_at         :datetime
#  updated_at         :datetime
#  state              :string(255)
#  needed             :integer
#  asap               :boolean          default(FALSE)
#  agency_profile_id  :integer
#  acct_manager_id    :integer
#  type               :string
#  mark_up            :decimal(, )
#  min_pay            :decimal(, )
#  max_pay            :decimal(, )
#  max_bill           :decimal(, )
#  desired_mark_up    :decimal(, )
#
# Indexes
#
#  index_job_orders_on_acct_manager_id     (acct_manager_id)
#  index_job_orders_on_agency_profile_id   (agency_profile_id)
#  index_job_orders_on_company_profile_id  (company_profile_id)
#  index_job_orders_on_state               (state)
#

require 'test_helper'

class JobOrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
