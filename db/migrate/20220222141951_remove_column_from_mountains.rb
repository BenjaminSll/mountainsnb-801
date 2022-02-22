class RemoveColumnFromMountains < ActiveRecord::Migration[6.1]
  def change
    remove_column :mountains, :photo, :string
  end
end
