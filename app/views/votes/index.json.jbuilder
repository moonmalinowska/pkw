json.array!(@votes) do |vote|
  json.extract! vote, :id, :vote, :district_id, :commitee_id
  json.url vote_url(vote, format: :json)
end
