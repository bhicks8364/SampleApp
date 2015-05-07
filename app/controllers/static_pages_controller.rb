class StaticPagesController < ApplicationController

  
  def home
  end

  def help
  end
  
  def about
    @employees = EmployeeProfile.all
  end

  
  def dashboard
    @user = current_user
    @company = @user.profile
    @job_orders = JobOrder.all
    @active_job_orders = JobOrder.active
    @employees = EmployeeProfile.all
    @companies = CompanyProfile.all
  end
  
end
