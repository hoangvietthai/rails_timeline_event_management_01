module SessionsHelper
  def current_user? user
    user == current_user
  end

  def current_ # {mapping}
    @current_ # {mapping} ||= warden.authenticate(scope: :#{mapping})
  end

  def change_type message_type
    if message_type == "notice"
      "success"
    elsif message_type == "alert"
      "danger"
    end
  end
end
