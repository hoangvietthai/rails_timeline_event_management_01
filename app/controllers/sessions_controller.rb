class SessionsController < ApplicationController
  layout "layoutlog", only: [:new, :create]

  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate params[:session][:password]
      activation user
    else
      flash.now[:danger] = t ".please_log"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end

  private

  def remember_user user
    params[:session][:remember_me] == "1" ? remember(user) : forget(user)
  end

  def activation user
    if user.activated?
      log_in user
      remember_user user
      if user.admin?
        redirect_to admin_root_path
      else
        redirect_back_or home_path
      end
    else
      flash[:warning] = t ".cannot"
      redirect_to root_url
    end
  end
end
