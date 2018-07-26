class NotificationsController < ApplicationController
  before_action :find_by, only: :show

  def show; end

  private
  def find_by
    @noti = Notification.find_by id: params[:id]
    
    return if @noti
    flash[:danger] = t ".noti_not"
    redirect_to root_url
  end
end
