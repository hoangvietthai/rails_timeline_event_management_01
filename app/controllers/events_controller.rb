class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.select :id, :description, :time_from,
      :time_to, :importance, :place
  end

  def show; end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = current_user.events.build event_params
    if @event.save
      UserEvent.create event: @event, user: current_user
      @event.create_notification notify_before: @event.get_notify_before
      current_user.send_mail_notification @event
    else
      render :new
    end
  end

  def update
    if @event.update_attributes event_params
      render head: :no_content
    else
      render :edit
    end
  end

  def destroy
  return if @event.destroy
    flash[:warning] = t ".delete_fail"
    redirect_to root_path
  end

  private
  def set_event
    @event = Event.find_by id: params[:id]
    return if @event
    flash[:danger] = t ".event_not"
    redirect_to home_path
  end

  def event_params
    params.require(:event).permit :description, :place, :time_from,
      :time_to, :visibility, :importance
  end
end
