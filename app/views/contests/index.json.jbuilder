json.array!(@contests) do |contest|
  json.extract! contest, :id, :name, :description, :uploadBy, :voteBy, :endBy
  json.url contest_url(contest, format: :json)
end
