json.array!(@contests) do |contest|
  json.extract! contest, :id, :string, :string, :datetime, :datetime, :datetime
  json.url contest_url(contest, format: :json)
end
