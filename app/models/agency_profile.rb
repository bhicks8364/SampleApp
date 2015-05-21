# == Schema Information
#
# Table name: agency_profiles
#
#  id          :integer          not null, primary key
#  agency_name :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class AgencyProfile < ActiveRecord::Base
    has_many :users, -> { where profile_type: 'AgencyProfile' }, class_name: "User", foreign_key: "profile_id"
    # has_many :agency_users, -> { where processed: true }, class_name: 'User'
    has_many :job_orders
    has_many :assignments, through: :job_orders
    has_many :employee_profiles, through: :assignments
    has_many :timesheets, -> { order(week: :desc, updated_at: :desc) }, through: :assignments 
    has_many :company_profiles, through: :job_orders
    has_many :account_managers, -> { where role: 'Account Manager' }, class_name: "User", foreign_key: "profile_id"
    has_one :owner, -> { where role: 'Owner' }, class_name: "User", foreign_key: "profile_id"
    
    accepts_nested_attributes_for :users

    def name
        self.agency_name
    end
    
    
    # This WORKS!!!! I just dont know WHERE TO USE IT!!!! 
    def add_as_recruiter(user)
       user.profile = self
       self.users << user
       user.update(role: "Recruiter")
       user
    end
    def add_as_sales(user)
       self.users << user
       user.update(role: "Sales Team")
       user
    end
    def add_as_payroll(user)
       self.users << user
       user.update(role: "Payroll")
       user
    end
    def add_as_admin(user)
       self.users << user
       user.update(role: "Agency Super", admin: true)
       user
    end
        
    
end
