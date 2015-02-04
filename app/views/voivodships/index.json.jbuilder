json.array!(@voivodships) do |voivodship|
  json.extract! voivodship, :id, :name
  json.url voivodship_url(voivodship, format: :json)
end
