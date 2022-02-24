class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @mountain = Mountain.find(params[:mountain_id])
    @booking.mountain = @mountain
  end

  def create
    @booking = Booking.new(booking_params)
    @mountain = Mountain.find(params[:mountain_id])
    @booking.mountain = @mountain
    @booking.user = current_user
    @booking.calcul_price
    if @booking.save
      redirect_to mountain_path(@mountain)
    else
      raise
    end
    flash[:notice] = 'Your mountain has been reserved'
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(status: true)
    redirect_to booked_path(@booking)
    flash[:notice] = 'Your booking has been approved'
  end

  private

  def booking_params
    params.require(:booking).permit(:departure, :arrival, :status, :user_id, :booking_id, :total_price)
  end

end
