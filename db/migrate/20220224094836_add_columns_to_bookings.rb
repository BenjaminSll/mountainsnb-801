class AddColumnsToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :departure, :date
    add_column :bookings, :arrival, :date
    add_column :bookings, :status, :boolean, default: false
    add_column :bookings, :total_price, :integer, default: 0
  end
end
