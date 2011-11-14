class CreateTraders < ActiveRecord::Migration
  def change
    create_table :traders do |t|
      t.string :type
      
      # all Traders
      t.integer :position
      
      # TravelingParties only
      t.integer :user_id
      t.integer :money
      t.integer :speed
      t.integer :ration
      t.integer :capacity
      
      # Store only
      #

      t.timestamps
    end
  end
end
