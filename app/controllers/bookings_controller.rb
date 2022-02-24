class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @mountain = Mountains.find(params[:mountain_id])
    @booking.mountain = @mountain
  end

  def create
    @booking = Booking.new(bookings_params)
    @mountain = Mountain.find(params[:mountain_id])
    @booking.mountain = @mountain
    @booking.user = current_user
    @booking.total_price = booking_price(@booking)
    @booking.save
    redirect_to mountain_path(@mountain)
    flash[:notice] = 'Your mountain has been reserved'
  end

  def accept

    @booking = Booking.find(params[:id])
    @booking.update(status: true)
    # redirect_to dashboard_path(active:"bookings")
  end

  private

  def booking_params
    params.require(:bookings).permit(:departure, :arrival, :status, :user_id, :booking_id, :total_price)
  end

  def booking_price(booking)
    (booking.departure - booking.arrival) * booking.mountain.price
  end
end