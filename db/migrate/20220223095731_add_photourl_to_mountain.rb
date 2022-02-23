class AddPhotourlToMountain < ActiveRecord::Migration[6.1]
  def change
    add_column :mountains, :photo_url, :string
  end
end
