class UsersController < ApplicationController
  layout "layoutlog", only: [:new, :create]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  before_action :find_by, only: [:show, :edit, :update, :correct_user,
    :destroy]

  def index
    @users = User.where(activated: true).paginate page: params[:page],
      per_page: Settings.paginate.per_page
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t ".please_check_email"
      redirect_to login_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t ".deleted"
      redirect_to users_url
    else
      flash[:warning] = t ".delete_fail"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit :email, :password,
      :password_confirmation
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t ".please_log"
    redirect_to login_url
  end

  def correct_user
    redirect_to root_url unless current_user? @user
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def find_by
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t ".user_not"
  end
end
