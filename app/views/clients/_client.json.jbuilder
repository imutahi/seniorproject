json.extract! client, :id, :status, :name, :company, :address, :city, :state, :zip, :phone, :fax, :email, :notes, :admin, :created_at, :updated_at
json.url client_url(client, format: :json)
