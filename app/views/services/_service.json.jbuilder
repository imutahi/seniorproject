json.extract! service, :id, :service_type, :description, :price, :created_at, :updated_at
json.url service_url(service, format: :json)
