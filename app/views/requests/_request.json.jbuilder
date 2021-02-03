json.extract! request, :id, :client_name, :first_name, :middle_name, :last_name, :maiden_name, :dob, :ssn, :dl_num, :dl_state, :notes, :user_id, :client_id, :created_at, :updated_at
json.url request_url(request, format: :json)
