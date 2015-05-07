class AgencyProfilesController < ApplicationController
    
    def index
        @agency_profiles = AgencyProfile.all
    end
    
    def new
        @agency_profile = AgencyProfile.new
        # @agency_profile = AgencyProfile.new
        # @agency_profile.users.build
    end
    
    def add_user
        @agency_profile = AgencyProfile.find(params[:id])
        # @user = @agency_profile.users.build
        # @user.update(role: "Sales")
        # @agency_profile.save
    end
    
    def create
        @agency_profile = AgencyProfile.create(agency_profile_params)
        @agency_profile.users.build
        # @agency_profile.users.new
        # @agency_profile.users.first.profile_id = @agency_profile.id

        
        if @agency_profile.save
        flash[:success] = "Agency Profile Added!"
        redirect_to @agency_profile
        else
        render 'new'
        end
    end
    
    def edit
        @agency_profile = AgencyProfile.find(params[:id])
        # @agency_profile.users.new
    end
    
  def update
    @agency_profile = AgencyProfile.find(params[:id])
    @agency_profile.update(agency_profile_params)
    # @agency_profile.users.build

    
    if @agency_profile.save
      flash[:success] = "Agency updated"
      redirect_to @agency_profile
    else
      render 'edit'
    end
  end


    def show
        @agency_profile = AgencyProfile.find(params[:id])
        @job_orders = @agency_profile.job_orders.by_fill_date.limit(5)
        @profile = current_user.profile
    end
  
    def agency_profile_params
        params.require(:agency_profile).permit!
    end
    def user_params
      params.require(:user).permit(:first_name, :last_name, :role, :email, :password,
                                   :password_confirmation, :profile_id, :profile_type)
    end

    
    
end