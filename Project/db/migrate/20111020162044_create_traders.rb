class CreateTraders < ActiveRecord::Migration
  def change
    create_table :traders do |t|
      t.string :type
      
      # all Traders
      t.integer :position, default: 0
      
      # TravelingParties only
      t.integer :user_id
      t.integer :money
      t.integer :speed
      t.integer :ration
      t.integer :days, default: 0
      
      # Store only
      #

      t.timestamps
    end
  end
end
