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
    has_many :agency_profiles, through: :job_orders
    has_many :assignments, through: :job_orders
    has_many :timesheets, through: :assignments
    has_many :employee_profiles, through: :assignments
    has_many :company_owners, -> { where role: 'Company Owner' }, class_name: "User", foreign_key: "profile_id"
    has_many :users, -> { where profile_type: 'CompanyProfile' }, class_name: "User", foreign_key: "profile_id"
    accepts_nested_attributes_for :users
    accepts_nested_attributes_for :job_orders
    
    # validates_associated :user
    
    # CompanyProfile.joins(job_orders: [{assignments: :employee_profile }, :assignments]).first
    scope :with_active_orders, -> { joins(:job_orders).merge(JobOrder.active)}
    
    def account_manager
        if self.job_orders.last.account_manager.present?
            self.job_orders.last.account_manager.name
        end
    end
    
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
    
    def positions_available
        self.job_orders.active.to_a.sum(&:needed).round(0)
    end
    
    def unfilled_positions
        self.job_orders.active.to_a.sum(&:needed).round(0) - self.assignments.active.count
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
