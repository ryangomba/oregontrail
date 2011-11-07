class AddRivers < ActiveRecord::Migration
    def change
        create_table :rivers do |t|
            t.integer :position
            t.integer :min_depth
            t.integer :max_depth
            t.boolean :ferry

            t.timestamps
        end
    end
end
