json.array!(@references) do |reference|
  json.extract! reference, :id, :key, :title, :author, :url, :summary
  json.url reference_url(reference, format: :json)
end
