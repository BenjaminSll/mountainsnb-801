class AddPhotoToMountains < ActiveRecord::Migration[6.1]
  def change
    add_column :mountains, :photo, :string
  end
end
