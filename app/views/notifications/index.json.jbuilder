json.array!(@notifications) do |notification|
  json.extract! notification, :id, :email
  json.url notification_url(notification, format: :json)
end
