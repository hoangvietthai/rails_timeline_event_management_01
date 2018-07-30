class AdminsController < ApplicationController
  def index; end

  def table
    @users = User.where(activated: true).paginate page: params[:page],
      per_page: Settings.paginate.per_page
  end
end
