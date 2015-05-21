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

class JobOrder < ActiveRecord::Base
  belongs_to :company_profile
  belongs_to :agency_profile
  has_many :assignments
  has_many :timesheets, through: :assignments, class_name: "Timesheet"
  has_many :employee_profiles, through: :assignments, class_name: "EmployeeProfile"
  belongs_to :account_manager, -> { where(role: 'Account Manager') }, :class_name => 'User', :foreign_key => 'acct_manager_id'

  validates :job_title,  presence: true, length: { maximum: 30 }
  validates :job_description,  presence: true
  validates :needed,  presence: true
  validates_associated :company_profile
  validates_associated :agency_profile
  
  accepts_nested_attributes_for :assignments
  accepts_nested_attributes_for :employee_profiles
  scope :active, -> { where(active: true)}
  scope :asap, -> { where(asap: true)}
  scope :by_fill_date, lambda { order("fill_date DESC") }
  scope :by_company, lambda { order("company_profile_id DESC") }
  scope :newest_first, -> { order("created_at DESC") }
  
  
  state_machine :state, :initial => :submitted do
    # event :approve do
    #   transition :submitted => :approved
    # end

    
  end
  
  def low_markup
    self.max_bill / self.max_pay
  end
  
  def high_markup
    self.max_bill / self.min_pay
  end
  
  def percent_filled
    percent = (self.assignments.count.to_d / self.needed.to_d) * 100
    percent.to_d
  end
  
  
  def self.latest_order
    order('created_at desc').first
  end
  
  def needs_attention?
    if self.assignments.present?
      if self.needed > self.assignments.active.count 
        true
      else
        false
      end
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
