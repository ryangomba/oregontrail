class CreateTravelingParties < ActiveRecord::Migration
  def change
    create_table :traveling_parties do |t|
      t.integer :speed
      t.integer :ration
      t.integer :position
      t.references :travelers

      t.timestamps
    end
    add_index :traveling_parties, :travelers_id
  end
end
