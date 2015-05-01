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
    has_one :user, as: :profile
    accepts_nested_attributes_for :user
    accepts_nested_attributes_for :job_orders
    
    # validates_associated :user
    
    # CompanyProfile.joins(job_orders: [{assignments: :employee_profile }, :assignments]).first
    
    
    def self.employees
        self.assignments
    end
    
    def company_admin
        self.user
    end
    
    def name
        self.company_name
    end
    
    #  def update_balance!
    #     self.balance = self.account_entries.approved.sum(:amount)
    #     self.save
    # end
    
    # def global_user
    #     self.user.to_global_id if self.user.present?
    # end

    # def global_user=(user)
    #     self.user = GlobalID::Locator.locate user
    # end
    

        
    
    
end
