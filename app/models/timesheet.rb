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

class Timesheet < ActiveRecord::Base
  belongs_to :assignment
  has_many :shifts
  
  validates_associated :assignment

  
  
  delegate :employee, to: :assignment
  delegate :company, to: :assignment
  delegate :pay_rate, to: :assignment
  delegate :bill_rate, to: :assignment

  
  
  accepts_nested_attributes_for :assignment
  accepts_nested_attributes_for :shifts
  
  before_create :set_defaults
  
  before_save :calculate_totals, :total_pay, :total_ot, :total_bill
  
  
  
  
  
  
  
  
  
  def mark_up
    self.bill_rate / self.pay_rate
  end
  
  
  
  def calculate_totals
    hours = self.shifts.sum(:hours_worked)
    if hours > 40
      self.reg_hours = 40
      self.ot_hours = hours - 40
    else
      self.reg_hours = hours
    end
  end
  
  def total_pay
   if self.reg_hours != 0 && self.pay_rate 
      self.gross_pay = self.reg_hours * self.pay_rate
   else
     self.gross_pay = "0.0".to_d
   end
  end 
  
  def total_ot
    if self.ot_hours != 0 && self.ot_hours != nil
      ot_pay = self.ot_hours * (pay_rate * 1.5)
      self.gross_pay = gross_pay + ot_pay
    else
      self.gross_pay = self.gross_pay
    end
  end
  
  def total_bill
    if self.gross_pay != 0
      self.gross_bill = self.gross_pay * mark_up
    else
      self.gross_bill
    end
  end
    
  
  def set_defaults
    self.reg_hours = 0
    self.ot_hours = 0
    self.gross_pay = 0
    self.gross_bill = 0
    # self.save
  end
  
  def self.company
    self.assignment.company_profile
  end
  
  def self.employee
    self.assignment.employee_profile
  end
  
  def self.pay_rate
    self.assignment.pay_rate
  end
  
  def self.bill_rate
    self.assignment.bill_rate
  end
  
  private
  
  # def log_when_shift_updated
  #   "#{timesheet.id} was updated!"
  # end
  
  
end
