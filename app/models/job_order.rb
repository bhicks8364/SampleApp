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
#
# Indexes
#
#  index_job_orders_on_company_profile_id  (company_profile_id)
#

class JobOrder < ActiveRecord::Base
  has_many :assignments
  has_many :employee_profiles, through: :assignments
  belongs_to :company_profile
  
  accepts_nested_attributes_for :assignments
  accepts_nested_attributes_for :employee_profiles
  scope :active, -> { where(active: true)}
  

  
end
