class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :client_name
      t.boolean :status
      t.integer :total_requests
      t.string :company
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :fax
      t.string :notes
      t.integer :client_id

      t.timestamps
    end
  end
end
