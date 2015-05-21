# == Schema Information
#
# Table name: employee_profiles
#
#  id             :integer          not null, primary key
#  employee_name  :string(255)
#  ssn            :string(255)
#  w2_box5        :integer
#  marital_status :string(255)
#  created_at     :datetime
#  updated_at     :datetime

#

class EmployeeProfile < ActiveRecord::Base
    include ArelHelpers::ArelTable
    
    has_many :assignments


    has_many :timesheets, through: :assignments
    has_many :shifts, through: :assignments
    has_many :job_orders, through: :assignments
    has_many :agency_profiles, through: :job_orders
    has_one :user, as: :profile
    has_one :current_shift, -> { where state: 'clocked_in' }, class_name: "Shift", foreign_key: "employee_profile_id"
    has_one :current_assignment, -> { where state: 'active' }, class_name: "Assignment", foreign_key: "employee_profile_id"    
    
    # scope :with_active_orders, -> { joins(:job_orders).merge(JobOrder.active)}
    scope :with_active_assignments, -> { joins(:assignments).merge(Assignment.active)}
    # scope :unassigned, joins(:assignments).merge(Assignment.active)

     scope :unassigned, -> { joins(:assignments).where.not(id: Assignment.active.pluck(:employee_profile_id)) }

    
    
    
    accepts_nested_attributes_for :user
    # accepts_nested_attributes_for :job_orders
    accepts_nested_attributes_for :assignments
    
    validates_associated :user
    
    delegate :email, to: :user
    delegate :role, to: :user
    
    scope :on_shift, -> { joins(:shifts).merge(Shift.clocked_in)}
    
    def self.with_current_shift
        joins(:current_shift)
    end
        
    
    def last_assignment_timesheets
        self.assignments.last.timesheets
    end
    
    def current_timesheet
        self.timesheets.where(week: Date.today.cweek).last
    end
    
    def current_shift
        self.shifts.clocked_in.last
    end
    # def current_assignment
    #     self.current_shift.assignment
    # end
    
    def has_assignment?
        if self.assignments.any?
            true
        else
            false
        end
    end
    
    def is_assigned?
        if self.assignments.where(state: "active").any?
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
