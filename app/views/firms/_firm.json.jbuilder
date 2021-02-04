json.extract! firm, :id, :invoice_data, :first_name, :middle_name, :last_name, :maiden_name, :dob, :ssn, :dl_state, :dl_number, :notes, :client_request, :created_at, :updated_at
json.url firm_url(firm, format: :json)
