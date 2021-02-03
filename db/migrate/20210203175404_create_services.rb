class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :service_type
      t.string :description
      t.string :price

      t.timestamps
    end
  end
end
