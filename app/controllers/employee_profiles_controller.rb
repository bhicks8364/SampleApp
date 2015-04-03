class EmployeeProfilesController < ApplicationController
    # def create
    #     user = User.create(user_params) { |u| u.profile = EmployeeProfile.create!(employee_profile_params) }
    #     session[:user_id] = user.id
    #     user.save
    #     redirect_to root_url
    # end
  def index
    @employees = EmployeeProfile.all
  end

  def show
    @employee = EmployeeProfile.find(params[:id])
    @assignments = @employee.assignments
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
  end
private
  def employee_profile_params
    params.require(:employee_profile).permit!
  end
  def user_params
    params.require(:user).permit!
  end
end
