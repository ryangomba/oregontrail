class AddTravelingPartyToTravelers < ActiveRecord::Migration
  def change
    add_column :travelers, :traveling_party_id, :relations
  end
end
