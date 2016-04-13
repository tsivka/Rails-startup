json.array!(@treatmenttypes) do |treatmenttype|
  json.extract! treatmenttype, :id, :name
  json.url treatmenttype_url(treatmenttype, format: :json)
end
