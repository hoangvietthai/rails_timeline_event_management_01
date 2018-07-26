json.array! @events do |event|
  date_format = event.all_day_event? ? "%Y-%m-%d" : "%Y-%m-%dT%H:%M:%S"
  json.id event.id
  json.description event.description
  json.time_from event.time_from.strftime(date_format)
  json.time_to event.time_to.strftime(date_format)
  json.importance event.importance
  json.place event.place
  json.remind event.remind
  json.visibility event.visibility
  json.allDay event.all_day_event? ? true : false
  json.update_url event_path(event, method: :patch)
  json.edit_url edit_event_path(event)
end
