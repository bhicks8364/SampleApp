# == Schema Information
#
# Table name: employee_profiles
#
#  id             :integer          not null, primary key
#  ssn            :string(255)
#  w2_box5        :integer
#  marital_status :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  employee_name  :string(255)
#

class EmployeeProfile < ActiveRecord::Base
    has_many :assignments
    has_many :timesheets, through: :assignments
    has_many :shifts, through: :assignments
    has_many :job_orders, through: :assignments
    has_one :user, as: :profile
    
    
    
    accepts_nested_attributes_for :user
    accepts_nested_attributes_for :job_orders
    accepts_nested_attributes_for :assignments
    
    validates_associated :user

    
    def last_assignment_timesheets
        self.assignments.last.timesheets
    end
    
    def current_timesheet
        self.timesheets.where(week: Date.today.cweek).last
    end
    
    def current_shift
        self.shifts.clocked_in.last
    end
    def current_assignment
        self.current_shift.assignment
    end
    
    def has_assignment?
        if self.assignments.any?
            true
        else
            false
        end
    end
    
    def is_assigned?
        if self.assignments.where(state: "Current").any?
            true
        else
            false
        end
    end
    
    def is_clocked_in?
        if self.shifts.clocked_in.any?
            true
        else
            false
        end
    end

        
    
    def name
        self.employee_name
    end
    
end
