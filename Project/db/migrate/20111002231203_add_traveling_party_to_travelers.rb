class AddTravelingPartyToTravelers < ActiveRecord::Migration
  def change
    add_column :travelers, :traveling_party, :relations
  end
end
