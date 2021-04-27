class AddTotalToFirms < ActiveRecord::Migration[6.0]
  def change
    add_column :firms, :total, :decimal
  end
end
