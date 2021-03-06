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
#  recruiter_id        :integer
#
# Indexes
#
#  index_assignments_on_employee_profile_id  (employee_profile_id)
#  index_assignments_on_job_order_id         (job_order_id)
#  index_assignments_on_state                (state)
#

class Assignment < ActiveRecord::Base
  belongs_to :employee_profile
  belongs_to :job_order, -> { includes :company_profile }
  has_many :timesheets
  has_many :shifts

  validates :pay_rate,  presence: true
  validates :state,  presence: true
  validates_associated :job_order
  validates_associated :employee_profile
  
  delegate :job_title, to: :job_order
  # delegate :company_profile, to: :job_order

  # before_create :set_defaults
  after_create :send_assignment_notification

  # scope :by_status, -> { where(status: status) }
  
  accepts_nested_attributes_for :employee_profile
  accepts_nested_attributes_for :job_order
  accepts_nested_attributes_for :shifts
  accepts_nested_attributes_for :timesheets
  
  scope :on_shift, -> { joins(:shifts).merge(Shift.clocked_in)}
  scope :active, -> { with_state(:active) }
  scope :inactive, -> { with_state(:inactive) }
  scope :with_current_timesheets, -> { joins(:timesheets).merge(Timesheet.current)}
 
 
 
  
  state_machine :state, :initial => :active do
    event :cancel do
      transition :active => :inactive
    end
    event :assign do
      transition :all => :active
    end
  end
  
  
  def employee_profile
    super || GuestEmployee.new

  end
  
  def weeks_worked
    self.timesheets.count
  end
  
  
  def mark_up
    self.bill_rate / self.pay_rate
  end
  
  def send_assignment_notification
    user = self.job_order.account_manager
    UserMailer.assignment_notification(user, self)
  end
  
  
  
  # def set_defaults
  #   self.state = "Current"
  # end
  def gross_assignment_pay  
    self.timesheets.to_a.sum(&:gross_pay)
  end
  
  def gross_assignment_bill 
    self.timesheets.to_a.sum(&:gross_bill)
  end
  
  def total_reg_hours
    self.timesheets.to_a.sum(&:reg_hours).round(2)
  end
  
  def total_ot_hours
    self.timesheets.to_a.sum(&:ot_hours).round(2)
  end
  
  
  
  scope :newest_first, lambda { order("shifts.time_in DESC") }
  
  def self.created_today
    where("created_at >= ? AND created_at < ?", Date.today, Date.tomorrow)
  end
  
  def self.created_today
    where("created_at >= ? AND created_at < ?", Date.today, Date.tomorrow)
  end
  
  def self.last_week
   where(:time_in => 1.week.ago.beginning_of_week..1.week.ago.end_of_week)
  end
  

  def is_clocked_in?
    if self.shifts.clocked_in.any?
      true
    else
      false
    end
  end
  
  def most_recent_timesheet
    self.timesheets.last
  end
  
  def most_recent_shift
    self.shifts.last
  end
  
  
  
  def current_shift
    self.shifts.where(:state => "clocked_in").last
  end

  def company_profile
      self.job_order.company_profile
  end
  
  # def company
  #   if self.job_order != nil
  #     self.job_order.company_profile.name
  #   else
  #     "No Job Order"
  #   end

  # end
  
  # def job_title
  #   if self.job_order != nil
  #     self.job_order.job_title
  #   else
  #     "No Job Order"
  #   end
  # end
  
  # def employee
  #   self.employee_profile
  # end
    
  
  def hours_today
    self.shifts.created_today.sum(:hours_worked).to_f
  end
  
  def hours_last_week
    self.shifts.last_week.sum(:hours_worked).to_f
  end
  
  def todays_pay
    self.hours_today * self.pay_rate
  end
  
  def todays_bill
    self.hours_today * self.bill_rate
  end
  
  
end
