class AddPaidToFirms < ActiveRecord::Migration[6.0]
  def change
    add_column :firms, :paid, :boolean, default: false
  end
end
