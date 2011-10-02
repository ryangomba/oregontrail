class CreateTravelers < ActiveRecord::Migration
  def change
    create_table :travelers do |t|
      t.string :name
      t.integer :health
      t.string :profession

      t.timestamps
    end
  end
end
