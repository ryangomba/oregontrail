class CreateTravelers < ActiveRecord::Migration
  def change
    create_table :travelers do |t|
      t.string :type
      
      # all Travelers
      t.string :name
      t.integer :health
      t.integer :traveling_party_id

      # Leaders only
      t.string :profession

      t.timestamps
    end
  end
end
