class CreateTravelers < ActiveRecord::Migration
  def change
    create_table :travelers do |t|
      t.string :type
      
      # all Travelers
      t.string :name
      t.integer :health, default: 100
      t.integer :traveling_party_id
      t.string :illnesses, default: '00000'

      # Leaders only
      t.string :profession

      t.timestamps
    end
  end
end
