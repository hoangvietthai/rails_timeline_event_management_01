class EventsManagementController < ApplicationController
  layout "events_mana_header", only: [:created_events, :invited_events, :search_events]
  before_action :user_signed_in?, only: [:created_events, :invited_events, :search_events]
  before_action :get_invited_events
  before_action :get_created_events

  def created_events; end

  def invited_events; end

  def search_events;  end

  private

  def get_invited_events
    inv_event = current_user.user_events.select{|e| e.permission.zero?}.map do |ev|
      current_user.events.find_by(id: ev.event_id)
    end
    @invited_events = Kaminari.paginate_array(inv_event).page(params[:page]).per Settings.paginate.per_page
  end

  def get_created_events
    cre_event = current_user.user_events.select{|e| e.permission == 1}.map do |ev|
      current_user.events.find_by(id: ev.event_id)
    end
    @created_events = Kaminari.paginate_array(cre_event).page(params[:page]).per Settings.paginate.per_page
  end
end
