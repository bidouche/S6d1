class UsersController < ApplicationController
skip_before_action :require_login, only: [:new, :create]
	def index
		@users = User.all
		
	end
	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			log_in @user
			flash[:success] = "Welcome #{@user.email}"
			redirect_to @user
		else
			flash[:danger] = "You have to fill up every imput properly"
			redirect_to login_path
		end
	end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name,:email)
    end

end