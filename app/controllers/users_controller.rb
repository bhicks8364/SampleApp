class UsersController < ApplicationController
  # before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  # before_action :correct_user, only: :show
  # before_action :admin_user,     only: :destroy
  # load_and_authorize_resource
  # load_resource :company_profile
  # load_resource :agency_profile
  # load_resource :employee_profile
  # load_and_authorize_resource :user, :through => [:company_profile, :agency_profile, :employee_profile]


  def index
    @agency_users = User.agency_users.all
    @company_users = User.company_users.all
    @employee_users = User.employee_users.all
    
    # @current_user = current_user
    @profile = current_user.profile
    
    # @agency_users = @profile.users.agency_users
    # # @company_users = User.company_users
    # # @employee_users = User.employee_users
    # @account_managers = @profile.account_managers
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @am_job_orders = @user.orders 
    @companies = @profile.company_profiles.order(company_name: :asc).distinct
    @employees = @profile.employee_profiles.order(employee_name: :asc).distinct
    
  end

  def new
    @user = User.new
    # @user.profile.new
    
  end

  def create
    @user = User.create(user_params)


    if @user.save
      flash[:info] = "#{@user.name} was successfuly added as a #{@user.role}!"
      # @user.send_activation_email
      # flash[:info] = "Please check your email to activate your account."
      redirect_to @user
    else
      
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "User Info updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  def make_admin
    @user = User.find(params[:id])
    if @user.admin?
       @user.update(admin: false, updated_at: Time.zone.now)

    else
       @user.update(admin: true, updated_at: Time.zone.now)
    end
    @user.save!
    # if @user.save
    #   flash[:info] = "User is now an Admin User"
    # end
  end
  
  def change_role
    @user = User.find(params[:id])
    if @user.admin?
       @user.update(admin: false, updated_at: Time.zone.now)

    else
       @user.update(admin: true, updated_at: Time.zone.now)
    end
    @user.save!
    # if @user.save
    #   flash[:info] = "User is now an Admin User"
    # end
  end

  private
  
  # def create_profile
  #   self.profile.create
  # end
    # def set_profile
    #   @user = User.find(params[:id])
    # end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :role, :email, :password,
                                   :password_confirmation, :profile_id, :profile_type)
    end
    
    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    
    
    
     # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
    
    
    
end