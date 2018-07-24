class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:home, :help, :about, :contact]
  def home; end

  def help; end

  def about; end

  def contact; end

  private

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t ".please_login"
    redirect_to login_url
  end
end
