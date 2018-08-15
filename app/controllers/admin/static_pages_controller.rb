class Admin::StaticPagesController < AdminsController
  layout "index", only: :tables
  before_action :find_users, only: :tables

  def index; end

  def tables; end

  def find_users
    @users = User.paginate page: params[:page],
      per_page: Settings.paginate.per_page
  end
end
