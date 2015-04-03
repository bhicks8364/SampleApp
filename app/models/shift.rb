# == Schema Information
#
# Table name: shifts
#
#  id            :integer          not null, primary key
#  assignment_id :integer
#  week          :date
#  hours_worked  :decimal(, )
#  time_in       :datetime
#  time_out      :datetime
#  state         :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_shifts_on_assignment_id  (assignment_id)
#

class Shift < ActiveRecord::Base
  belongs_to :assignment
  
  
  
  
  
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
