class AddTradingPartyToItems < ActiveRecord::Migration
  def change
	add_column :items, :trading_party_id, :relations
  end
end
