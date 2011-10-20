class AddMoneyToTravelingParties < ActiveRecord::Migration
  def change
    add_column :traveling_parties, :money, :integer
  end
end
