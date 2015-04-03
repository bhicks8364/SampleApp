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
    has_many :job_orders, through: :assignments
    has_one :user, as: :profile
    
    accepts_nested_attributes_for :user
    accepts_nested_attributes_for :job_orders
    accepts_nested_attributes_for :assignments
    
    validates_associated :user
    
    def name
        "#{user.name}"
    end
    
end
