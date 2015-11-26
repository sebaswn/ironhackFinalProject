
json.array!(@posts) do |post|
  json.extract! post, :id, :name, :description, :location, :picture
  json.url post_url(post, format: :json)
end
