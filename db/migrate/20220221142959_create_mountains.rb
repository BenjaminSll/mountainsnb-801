class CreateMountains < ActiveRecord::Migration[6.1]
  def change
    create_table :mountains do |t|
      t.string :name
      t.string :range
      t.float :height
      t.string :location
      t.string :terrain
      t.integer :trails
      t.string :difficulty
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
