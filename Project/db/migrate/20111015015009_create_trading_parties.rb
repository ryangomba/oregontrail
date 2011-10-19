class CreateTradingParties < ActiveRecord::Migration
  def change
    create_table :trading_parties do |t|

      t.timestamps
    end
  end
end
