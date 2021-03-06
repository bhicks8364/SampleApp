class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id])
  # end
  
  # def current_ability
  #   @current_ability ||= Ability.new(current_user, current_user.profile)
  # end
  
  # rescue_from CanCan::AccessDenied do |exception|
  #   flash[:error] = "Sorry...Access Denied."
  #   redirect_to root_url
  # end
  
  def profile
    @profile = current_user.profile
  end
  
end
