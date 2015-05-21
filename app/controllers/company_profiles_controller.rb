class CompanyProfilesController < ApplicationController
  # before_action :set_profile
  # load_and_authorize_resource
  
  def new
      @company_profile = CompanyProfile.new

  end
    
  def create
      @company_profile = CompanyProfile.create(company_profile_params)


      if @company_profile.save
        flash[:info] = "Company Profile was created!!"
        redirect_to @company_profile
      else
        render 'new'
      end
  end
    
  def index
    @q = CompanyProfile.search(params[:q])
    @company_profiles = @q.result.includes(:job_orders).limit(10).to_a.uniq
  end

  def show
    @company_profile = CompanyProfile.find(params[:id])
    @profile = current_user.profile
    @job_orders = @company_profile.job_orders
    @assignments = @company_profile.assignments
    @users = @company_profile.users.all.paginate(page: params[:page])
  end

  def edit
    # @company = CompanyProfile.find(params[:id])
  end

  def update
    @company_profile = CompanyProfile.find(params[:id])
    
    if @company_profile.update(company_profile_params)
      redirect_to company_profiles_path, notice: "The company_profile has been updated"
    end
  end

  def destroy
    @company = CompanyProfile.find(params[:id])
    @company.destroy
    flash[:success] = "Company deleted"
    redirect_to company_profiles_path
  end
private
 
# def set_profile
#   @profile = CompanyProfile.create
# def assign_admin(user)
#   @company = Company.find(params[:id])
#   @company.user = user
# end
#   # def company_profile_params
#   #   params.require(:company_profile).permit(:company_name, 
  #                                           user_attributes: [ :id, :last_name, :first_name,
  #                                           :password, :email, ] )
  # end
  
  def company_profile_params
    params.require(:company_profile).permit!
  end
end
