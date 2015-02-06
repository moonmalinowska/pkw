json.array!(@commitees) do |commitee|
  json.extract! commitee, :id
  json.url commitee_url(commitee, format: :json)
end
