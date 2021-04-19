class AddClientIdToDownloads < ActiveRecord::Migration[6.0]
  def change
    add_column :downloads, :client_id, :integer
  end
end
