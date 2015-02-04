json.array!(@users) do |user|
  json.extract! user, :id, :login, :password, :role, :crypted_password, :password_salt, :persistence_token, :password_digest
  json.url user_url(user, format: :json)
end
