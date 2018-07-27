class ApplicationMailer < ActionMailer::Base
  include UserHelper
  default from: ENV["MAIL_USERNAME"]
  layout "mailer"
end
