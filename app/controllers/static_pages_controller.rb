class StaticPagesController < ApplicationController
  def home
  end

  def help
  end
  
  def about
  end
  
  def dashboard
    @user = current_user

    @employees = EmployeeProfile.all
    @companies = CompanyProfile.all
  end
  
end
