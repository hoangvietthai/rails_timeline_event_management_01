class InvitesController < ApplicationController
  def new; end

  def create
    event_id = params[:invite][:event_id]
    params[:invite][:email].each do |email|
      user = User.find_by email: email
      next unless user.present?
      user_event = UserEvent.new event_id: event_id,
        user_id: user.id, permission: 0
      user_event.save
    end
    respond_to do |format|
      format.js
    end
  end

  def edit
    @invite_events = UserEvent.where event_id: params[:id]
  end

  private

  def invite_params
    params.require(:invite).permit :email
  end
end
