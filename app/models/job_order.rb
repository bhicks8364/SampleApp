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
  belongs_to :company_profile
  has_many :assignments
  has_many :employee_profiles, through: :assignments, class_name: "EmployeeProfile"


  
  accepts_nested_attributes_for :assignments
  accepts_nested_attributes_for :employee_profiles
  scope :active, -> { where(active: true)}
  
  def total_bill_amount  
    self.assignments.to_a.sum(&:gross_assignment_bill)
  end
  def total_pay_amount  
    self.assignments.to_a.sum(&:gross_assignment_pay)
  end
  def total_order_reg_hours
    self.assignments.to_a.sum(&:total_reg_hours)
  end
  def total_order_ot_hours
    self.assignments.to_a.sum(&:total_ot_hours)
  end
  
  

    
    

  
end
