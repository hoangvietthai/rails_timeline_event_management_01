class EventsManagementController < ApplicationController
  layout "events_mana_header", only: [:created_events, :invited_events]
  before_action :user_signed_in?, only: [:created_events, :invited_events]

  def created_events; end

  def invited_events; end
end
