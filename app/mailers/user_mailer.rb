class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t("activate_account")
  end

  def password_reset user
    @user = user
    mail to: user.email, subject: t("reset_pass")
  end

  def post_notice user, event
    @user = first_part_of user.email
    @event = event
    mail to: user.email, subject: t(".notice_of_deadline")
  end
end
