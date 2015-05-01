class CompanyProfilesController < ApplicationController
  # before_action :set_profile
  # load_and_authorize_resource
  
  def new
      # @company = CompanyProfile.new
      # # @company.build_user
  end
    
  def create
      # @company = CompanyProfile.create(company_profile_params)
      # @company.build_user

      if @company.save
        flash[:info] = "Company Profile was created!!"
        redirect_to @company
      else
        render 'new'
      end
  end
    
  def index
    @q = CompanyProfile.search(params[:q])
    @company_profiles = @q.result.includes(:job_orders).page(params[:page]).to_a.uniq
  end

  def show
    @company = CompanyProfile.find(params[:id])
    # @job_orders = @company.job_orders
  end



#   def create
#     @company = CompanyProfile.new
#     @company.user.create!

#     if @company.save
#       redirect_to company_profiles_path, notice: "The company has been successfully created."
#     end
#   end

  def edit
    # @company = CompanyProfile.find(params[:id])
  end

  def update
    # @company = CompanyProfile.find(params[:id])
    if @company.update(company_profile_params)
      redirect_to company_profiles_path, notice: "The company_profile has been updated"
    end
  end

#   def destroy
#     @company = CompanyProfile.find(params[:id])
#     @company.destroy
#   end
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
