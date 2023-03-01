class BookingsController < ApplicationController
  def new
    @user = current_user
    @listing = Listing.find(params[:id])
    @booking = Booking.new
    @booking.listing = @listing
  end

  def index
    @listing = Listing.find(params[:id])
    @bookings = Booking.all
end

  def create
    @listing = Listing.find(params[:id])
    @booking_date = booking_params[:booking_date]
    p @blocked_dates = convert_range_to_array(@booking_date)
    @blocked_dates.each do |date|
      p @booking = Booking.create(user_id: current_user.id, listing: @listing, booking_date: date)
    end
    @blocked_dates.each do |date|
      @availabilities = Availability.create(available: false, date: date, listing: @listing)
    end
    redirect_to listing_path(@listing)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to all_bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :listing_id, :booking_date)
  end

  def convert_range_to_array(str)
    a = str.split(" to ")
    a.map { |date| date.to_date }
    (a[0]..a[1]).to_a
  end
end
