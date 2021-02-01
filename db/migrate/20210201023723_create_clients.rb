class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.boolean :status
      t.string :name
      t.string :company
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :fax
      t.string :email
      t.string :notes
      t.boolean :admin

      t.timestamps
    end
  end
end
