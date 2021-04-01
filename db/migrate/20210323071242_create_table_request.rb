class CreateTableRequest < ActiveRecord::Migration[6.0]
  def change
    create_table :downloads do |t|
    	t.string :title
	    t.string :file

	    t.timestamps

    end
  end
end
