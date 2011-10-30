class AddLocationModel < ActiveRecord::Migration
  def change
	create_table :locations do |t|
		t.string :name
		t.integer :position
		t.float :lat
		t.float :lon
		t.timestamps 
	end
  end

end
