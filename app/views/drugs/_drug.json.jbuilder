json.extract! drug, :id, :name, :quantity, :price, :desc, :expiration, :created_at, :updated_at
json.url drug_url(drug, format: :json)
