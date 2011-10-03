class ChangeTravelingParty < ActiveRecord::Migration
  def up
      remove_column :traveling_parties, :travelers_id
  end

  def down
      add_column :traveling_parties, :travelers_id
  end
end
