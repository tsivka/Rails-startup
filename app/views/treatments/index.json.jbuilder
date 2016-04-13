json.array!(@treatments) do |treatment|
  json.extract! treatment, :id, :name
  json.url treatment_url(treatment, format: :json)
end
