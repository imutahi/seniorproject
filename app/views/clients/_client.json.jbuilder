json.extract! client, :id, :client_name, :status, :total_requests, :company, :email, :address, :city, :state, :zip, :phone, :fax, :notes, :client_id, :created_at, :updated_at
json.url client_url(client, format: :json)
