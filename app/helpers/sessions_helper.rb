module SessionsHelper
  def current_user? user
    user == current_user
  end

  def current_ # {mapping}
    @current_ # {mapping} ||= warden.authenticate(scope: :#{mapping})
  end
end
