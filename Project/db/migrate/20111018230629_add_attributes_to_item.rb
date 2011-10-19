class AddAttributesToItem < ActiveRecord::Migration
  def change
	add_column :items, :total_weight, :integer
	add_column :items, :total_price, :integer
  end
end
