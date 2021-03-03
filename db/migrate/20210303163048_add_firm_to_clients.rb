class AddFirmToClients < ActiveRecord::Migration[6.0]
  def change
    add_reference :clients, :firm, null: false, foreign_key: true
  end
end
