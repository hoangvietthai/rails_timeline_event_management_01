date_format = event.all_day_event? ? "%Y-%m-%d" : "%Y-%m-%dT%H:%M:%S"
json.id event.id
json.title event.description
json.start event.time_from
json.end event.time_to
json.color event.importance
json.allDay event.all_day_event? ? true : false
json.update_url event_path(event, method: :patch)
json.edit_url edit_event_path(event)
