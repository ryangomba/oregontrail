class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :type
      
      # all Items
      t.integer :trader_id

      # VariableItems only
      t.integer :health, default: 100
      t.boolean :in_use, default: false

      t.timestamps
    end
  end
end
