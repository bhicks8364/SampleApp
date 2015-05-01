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
    has_many :users, as: :profile
    # has_many :agency_users, -> { where processed: true }, class_name: 'User'
    has_many :job_orders
    has_many :assignments, through: :job_orders
    has_many :company_profiles, through: :job_orders
    

    def name
        self.agency_name
    end
    
end
