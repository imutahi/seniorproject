class AddClientIdToFirms < ActiveRecord::Migration[6.0]
  def change
    add_column :firms, :client_id, :integer
  end
end
