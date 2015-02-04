json.array!(@campaign_commitees) do |campaign_commitee|
  json.extract! campaign_commitee, :id, :name, :logo, :party
  json.url campaign_commitee_url(campaign_commitee, format: :json)
end
