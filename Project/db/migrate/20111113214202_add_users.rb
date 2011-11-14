class AddUsers < ActiveRecord::Migration
    def change
        create_table :users do |t|
    		t.string :email
    		t.string :first_name
    		t.string :last_name
    		t.string :image
    		t.string :f_id
    		t.string :f_token
    		t.timestamps
    	end
    end
end
