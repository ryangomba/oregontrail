class AddCapacityToTravelingParties < ActiveRecord::Migration
  def change
    add_column :traveling_parties, :capacity, :integer
  end
end
