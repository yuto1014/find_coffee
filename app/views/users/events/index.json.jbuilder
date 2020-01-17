json.array!(@events) do |event|
  json.title event.title
  json.body event.body
  json.id event.id
  json.start event.start
  json.end event.end
  json.url users_event_url(event, format: :html)
end