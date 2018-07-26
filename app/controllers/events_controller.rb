class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index; end

  def show; end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = Event.new event_params
    if @event.save
      flash[:success] = t ".create_ok"
      redirect_to home_path
    else
      render :new
    end
  end

  def update;  end

  def destroy
    @event.destroy
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
