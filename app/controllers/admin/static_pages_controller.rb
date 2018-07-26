class Admin::StaticPagesController < AdminsController
  layout "admin_header", only: [:index, :tables]
  before_action :find_users, only: [:tables]

  def index; end

  def tables; end

  def find_users
    @users = User.where(activated: true).paginate page: params[:page],
      per_page: Settings.paginate.per_page
  end
end
