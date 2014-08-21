json.array!(@users) do |user|
  json.extract! user, :id, :bundle
  json.url user_url(user, format: :json)
end
