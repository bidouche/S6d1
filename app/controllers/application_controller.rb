class ApplicationController < ActionController::Base
	before_action :require_login
	protect_from_forgery with: :exception
	include SessionsHelper
private
 
  def require_login
    unless logged_in?
      flash[:danger] = "You must be logged in order to access this section"
      redirect_to login_path
    end
  end

end
