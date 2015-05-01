class AgencyProfilesController < ApplicationController
    
    def index
        @agency_profiles = AgencyProfile.all
    end

    def show
        @agency_profile = AgencyProfile.find(params[:id])
        @job_orders = @agency_profile.job_orders.by_fill_date
    end
  
    def agency_profile_params
        params.require(:agency_profile).permit!
    end

    
    
end