class InvitesController < ApplicationController
  before_action :get_event_id, only: :create
  before_action :get_emails, only: :create

  def new; end

  def create
    @emails.each do |email|
      next if email_not_exist? email
      next if user_event_exist?
      @user_event = UserEvent.new event_id: @event_id,
                                  user_id: @user.id, permission: 0
      if @user_event.save
        flash[:success] = t(".invited") + email
      else
        flash[:warning] = ".cant_save"
      end
    end
  end

  def edit
    @invite_events = UserEvent.where event_id: params[:id]
  end

  private

  def invite_params
    params.require(:invite).permit :email
  end

  def get_event_id
    @event_id = params[:invite][:event_id]
  end

  def get_emails
    @emails = params[:invite][:email]
  end

  def email_not_exist? email
    @user = User.find_by email: email
    return false if @user.present?
    flash[:danger] = t(".account") + email + t(".not_exists")
  end

  def user_event_exist?
    return false unless UserEvent.exists? event_id: @event_id,
                                          user_id: @user.id, permission: 0
    flash[:warning] = t(".account") + @user.email + t(".has_been_invited")
  end
end
