class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :value
      t.integer :weight
      t.integer :quantity
      t.string :type

      t.timestamps
    end
  end
end
