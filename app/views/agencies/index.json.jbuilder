json.array!(@agencies) do |agency|
  json.extract! agency, :id, :name, :address, :city, :zip, :district, :region, :country, :phone, :is_freelancer, :logo, :description, :treatments
  json.url agency_url(agency, format: :json)
end
