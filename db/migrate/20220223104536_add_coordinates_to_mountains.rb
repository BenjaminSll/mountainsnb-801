class AddCoordinatesToMountains < ActiveRecord::Migration[6.1]
  def change
    add_column :mountains, :latitude, :float
    add_column :mountains, :longitude, :float
  end
end
