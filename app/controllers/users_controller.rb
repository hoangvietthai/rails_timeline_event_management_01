class UsersController < ApplicationController
  layout "layoutlog", only: [:edit, :update]
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy]
  before_action :find_by, only: [:show, :edit, :update,
    :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.where(activated: true).paginate page: params[:page],
      per_page: Settings.paginate.per_page
  end

  def show; end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".updated"
      redirect_to home_path
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
    redirect_to root_url
  end
end
