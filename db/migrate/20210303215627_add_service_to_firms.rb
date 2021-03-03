class AddServiceToFirms < ActiveRecord::Migration[6.0]
  def change
    add_reference :firms, :service, null: false, foreign_key: true
  end
end
