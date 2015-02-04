json.array!(@districts) do |district|
  json.extract! district, :id, :name, :electorate, :mandate, :invalid_vote, :empty_vote, :other_vote, :issued_voting_card
  json.url district_url(district, format: :json)
end
