class Admin::UsersController < ApplicationController
  layout "index", only: :destroy
  before_action :logged_in_user, only: :destroy
  before_action :find_by, only: [:correct_user, :destroy]
  before_action :admin_user, only: :destroy

  def destroy
    if @user.destroy
      flash[:success] = t ".deleted"
    else
      flash[:warning] = t ".delete_fail"
    end
    redirect_to admin_show_user_path
  end

  private

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
