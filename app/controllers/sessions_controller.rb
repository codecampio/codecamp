class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [ :new, :create ]

  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
				sign_in(@user)
        flash[:success] = "Welcome back, #{@user.name}!"
        redirect_to @user
    else
        flash.now[:error] = "Invalid email/password combination"
        render "new"
    end  	
  end

  def destroy
  	sign_out
  	redirect_to root_path
  end
end
