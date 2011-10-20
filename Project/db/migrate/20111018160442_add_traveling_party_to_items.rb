class AddTravelingPartyToItems < ActiveRecord::Migration
  def change
	add_column :items, :traveling_party_id, :relations
  end
end
