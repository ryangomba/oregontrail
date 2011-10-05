class CreateTravelingParties < ActiveRecord::Migration
  def change
    create_table :traveling_parties do |t|
      t.integer :speed
      t.integer :ration
      t.integer :position

      t.timestamps
    end
  end
end
