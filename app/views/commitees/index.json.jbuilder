json.array!(@commitees) do |commitee|
  json.extract! commitee, :id, :name, :logo, :party
  json.url commitee_url(commitee, format: :json)
end
