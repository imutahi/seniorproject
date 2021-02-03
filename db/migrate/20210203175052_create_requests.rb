class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :client_name
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :maiden_name
      t.string :dob
      t.string :ssn
      t.string :dl_num
      t.string :dl_state
      t.string :notes
      t.integer :user_id
      t.integer :client_id

      t.timestamps
    end
  end
end
