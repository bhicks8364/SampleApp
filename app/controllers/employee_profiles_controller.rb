class EmployeeProfilesController < ApplicationController
    # def create
    #     user = User.create(user_params) { |u| u.profile = EmployeeProfile.create!(employee_profile_params) }
    #     session[:user_id] = user.id
    #     user.save
    #     redirect_to root_url
    # end
    
    # load_and_authorize_resource
    
  # load_and_authorize_resource :assignment
  # load_and_authorize_resource :employee_profile, :through => :assignment
    
  def index
    @q = EmployeeProfile.search(params[:q])
    @employee_profiles = @q.result.includes(:timesheets).page(params[:page]).to_a.uniq
  end

  def show
    @employee_profile = EmployeeProfile.find(params[:id])
    @assignments = @employee_profile.assignments
    @current_timesheet = @employee_profile.current_timesheet
    @current_assignment = @employee_profile.current_assignment if @employee_profile.current_assignment != nil
    @timesheets = @employee_profile.timesheets
    @company_profile = @current_assignment.company_profile if @current_assignment

    
 
    
    # @q = Timesheet.search(params[:q])
    # @timesheets = @q.result.includes(:assignment, :shifts)



    # @user = @employee.user
  end

  def new
    @employee = EmployeeProfile.new
    # @employee.build_user
  end

  def create
    @employee = EmployeeProfile.create(employee_profile_params)
    # @employee.build_user(employee_profile_params)


    if @employee.save
      redirect_to @employee, notice: "The employee has been successfully created."
    else
      render 'new'
    end
  end

  def edit
    @employee = EmployeeProfile.find(params[:id])
  end

  def update
    @employee = EmployeeProfile.find(params[:id])
    if @employee.update_attributes(employee_profile_params)
      redirect_to dashboard_path, notice: "The employee has been updated"
    end
  end

  def destroy
    @employee = EmployeeProfile.find(params[:id])
    @employee.destroy
    flash[:success] = "Employee deleted"
    redirect_to employee_profiles_path
  end
private
  def employee_profile_params
    params.require(:employee_profile).permit!
  end
  def user_params
    params.require(:user).permit!
  end
end
