json.array!(@facts) do |fact|
  json.extract! fact, :id, :summary, :reference_id, :categories
  json.url fact_url(fact, format: :json)
end
