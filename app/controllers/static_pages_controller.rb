class StaticPagesController < ApplicationController

  
  def home
  end

  def help
  end
  
  def about
    @employees = EmployeeProfile.all
  end

  
  def dashboard
    @current_user = current_user
    @current_profile = current_user.profile
    @companies = @current_profile.company_profiles.order(company_name: :asc).distinct
    @assignments = @current_profile.assignments.with_current_timesheets
  end
  
end
