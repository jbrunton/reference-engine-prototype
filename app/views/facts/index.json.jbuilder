json.array!(@facts) do |fact|
  json.extract! fact, :id, :summary, :references, :categories
  json.url fact_url(fact, format: :json)
end
