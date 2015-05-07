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
#
# Indexes
#
#  index_job_orders_on_agency_profile_id   (agency_profile_id)
#  index_job_orders_on_company_profile_id  (company_profile_id)
#  index_job_orders_on_state               (state)
#

class JobOrder < ActiveRecord::Base
  belongs_to :company_profile
  belongs_to :agency_profile
  has_many :assignments
  has_many :timesheets, through: :assignments, class_name: "Timesheet"
  has_many :employee_profiles, through: :assignments, class_name: "EmployeeProfile"


  
  accepts_nested_attributes_for :assignments
  accepts_nested_attributes_for :employee_profiles
  scope :active, -> { where(active: true)}
  scope :asap, -> { where(asap: true)}
  scope :by_fill_date, lambda { order("job_orders.fill_date DESC") }
  scope :by_company, lambda { order("job_orders.company_profile DESC") }
  scope :newest_first, -> { order("job_orders.created_at DESC") }
  
  
  state_machine :state, :initial => :submitted do
    # event :approve do
    #   transition :submitted => :approved
    # end

    
  end
  def needs_attention?
    if self.needed > self.assignments.count
      true
    else
      false
    end
  end
  
  def self.needed_today
    where("fill_date >= ? AND fill_date < ?", Date.today, Date.tomorrow)
  end
  
  
  
  
  
  
  
  
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
