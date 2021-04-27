class AddClientEmailToDownloads < ActiveRecord::Migration[6.0]
  def change
    add_column :downloads, :email, :string
  end
end
