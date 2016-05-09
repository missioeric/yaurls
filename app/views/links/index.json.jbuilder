json.array!(@links) do |link|
  json.extract! link, :id, :full_url, :short_url, :clicks
  json.url link_url(link, format: :json)
end
