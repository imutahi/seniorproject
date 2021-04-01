class AddFileToFirms < ActiveRecord::Migration[6.0]
  def change
    add_column :firms, :file, :string
  end
end
