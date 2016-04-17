class UsersController < ApplicationController
  before_action :prohibit_user, only: [:new, :create]

  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      respond_to do |format|
        format.html {
          flash[:success] = "User account created!"
          redirect_to :back
        }
        format.js { }
      end
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :avatar, :email, :bio, :password, :password_confirmation)
  end

end
