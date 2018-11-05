class SessionsController < ApplicationController
 before_action :user_authenticated, only: [:new]
 skip_before_action :require_login, only: [:new, :create]
  def new
  @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    user_last_name = User.find_by(last_name: params[:session][:last_name])
     if (user == nil || user_last_name == nil)
      flash[:danger] = 'Invalid combination'
      render 'new'
    else (user.id == user_last_name.id)
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    end
  end
  def show
    
  end

    def destroy
      log_out
      redirect_to login_path
    end

    def user_authenticated
      if logged_in?
        redirect_to club_path
      end
    end
end