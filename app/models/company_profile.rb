# == Schema Information
#
# Table name: company_profiles
#
#  id           :integer          not null, primary key
#  company_name :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  balance      :decimal(, )
#

class CompanyProfile < ActiveRecord::Base
    has_many :job_orders
    has_many :assignments, through: :job_orders
    has_many :timesheets, through: :assignments
    # has_one :user, as: :profile
    has_many :users, as: :profile, class_name: 'User'
    accepts_nested_attributes_for :users
    accepts_nested_attributes_for :job_orders
    
    # validates_associated :user
    
    # CompanyProfile.joins(job_orders: [{assignments: :employee_profile }, :assignments]).first

    
    def self.employees
        self.assignments
    end
    
    def company_admin
        self.users.where(admin: true).last
    end

    
    def add_as_admin(user)
       self.users << user
       user.update(role: "Admin", admin: true, profile: self)
       user
    end
    
    def name
        self.company_name
    end
    
    def update_balance!
        balance = self.timesheets.approved.sum(:gross_bill)
        self.update(balance: balance)
    end
    
    # def global_user
    #     self.user.to_global_id if self.user.present?
    # end

    # def global_user=(user)
    #     self.user = GlobalID::Locator.locate user
    # end
    

        
    
    
end
