class CreateJoinTableFirmsServices < ActiveRecord::Migration[6.0]
  def change
    create_join_table :firms, :services do |t|
      # t.index [:firm_id, :service_id]
      # t.index [:service_id, :firm_id]
    end
  end
end
