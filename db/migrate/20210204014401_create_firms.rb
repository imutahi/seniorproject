class CreateFirms < ActiveRecord::Migration[6.0]
  def change
    create_table :firms do |t|
      t.string :invoice_data
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :maiden_name
      t.string :dob
      t.string :ssn
      t.string :dl_state
      t.string :dl_number
      t.string :notes
      t.string :client_request

      t.timestamps
    end
  end
end
