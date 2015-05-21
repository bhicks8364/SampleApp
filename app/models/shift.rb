# == Schema Information
#
# Table name: shifts
#
#  id            :integer          not null, primary key
#  assignment_id :integer
#  hours_worked  :decimal(, )
#  time_in       :datetime
#  time_out      :datetime
#  state         :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  timesheet_id  :integer
#  week          :integer
#
# Indexes
#
#  index_shifts_on_assignment_id  (assignment_id)
#  index_shifts_on_state          (state)
#

class Shift < ActiveRecord::Base
  belongs_to :timesheet, touch: true
  belongs_to :assignment
  
  validates_associated :timesheet
  validates_associated :assignment

  # before_create :new_timesheet
  # # after_save :go_to_shift
  
  
   delegate :employee_profile, to: :assignment
   delegate :company_profile, to: :assignment
   delegate :pay_rate, to: :assignment
   delegate :bill_rate, to: :assignment

  
  
  accepts_nested_attributes_for :timesheet
  accepts_nested_attributes_for :assignment
  
  scope :newest_first, lambda { order("shifts.time_in DESC") }
  scope :clocked_out, -> { with_state(:clocked_out) }
  scope :clocked_in, -> { with_state(:clocked_in) }
  scope :by_state, -> { group(:state) }
  
  state_machine :state, :initial => :initialized do
    
    
    event :clock_in do
      transition :initialized => :clocked_in
    end
    event :clock_out do
      transition :clocked_in => :clocked_out
    end
  end
  
  # ransacker :time_in do
  # Arel.sql('date(time_in)')
  # end
  
  def record_clock_in!
    self.time_in = Time.now
    self.week = Date.today.cweek
    self.timesheet = Timesheet.find_or_create_by(assignment_id: self.assignment_id, week: self.week)
    self.clock_in!
  end
  
  def record_clock_out!
    self.time_out = Time.now
    total = (self.time_out - self.time_in)
    self.hours_worked = total / 3600
    self.clock_out
  end
  
  

  
  
  def week_percent
    percent = (self.week.to_f / 52) * 100
    percent.to_i
  end

  
  
  def new_timesheet
    self.timesheet = Timesheet.find_or_create_by(assignment_id: self.assignment_id, week: Date.today.cweek)
    self.save
  end
  


  
  
  def self.created_today
    where("created_at >= ? AND created_at < ?", Date.today, Date.tomorrow)
  end
  
  def self.created_today
    where("created_at >= ? AND created_at < ?", Date.today, Date.tomorrow)
  end
  
  def self.last_week
    where(:time_in => 1.week.ago.beginning_of_week..1.week.ago.end_of_week)
  end
  
  def self.this_week
    where(:week => DateTime.now.cweek)
  end

  
  def set_week
    self.week = DateTime.now.cweek
    self.save
  end
  



  # def update_balance!
  #       self.balance = self.account_entries.approved.sum(:amount)
  #       self.save
  #   end
    

  
  
  
  # def calculate_hours
  #   self.hours_worked = self.time_out - self.time_in
  # end
  # def init
  #   self.hours_worked  ||= 0.00          #will set the default value only if it's nil
  #   # self.address ||= build_address #let's you set a default association
  # end
  
  # def time_diff(start_time, end_time)
  #   seconds_diff = (start_time - end_time).to_i.abs

  #   hours = seconds_diff / 3600
  #   seconds_diff -= hours * 3600

  #   minutes = seconds_diff / 60
  #   seconds_diff -= minutes * 60

  #   seconds = seconds_diff

  #   "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
  # end

    
  
  
end
