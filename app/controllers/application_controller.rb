class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user



  private

  def log_in(user)
    session[:user_id] = user.username
  end

  def current_user
    if session[:user_id]
      @user ||= User.find_by(username: session[:user_id])
    end
  end

  def require_user
    unless current_user
      flash[:danger] = "You have to be logged in to do that"
      redirect_to :root
    end
  end

  def prohibit_user
    if current_user
      flash[:success] = "You're already logged in!"
      redirect_to :root
    end
  end


end
