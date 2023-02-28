class BookingsController < ApplicationController
  def new
    @user = User.find(params[:id])
    @listing = Listing.find(params[:id])
    @booking = Booking.new
    @booking.listing = @listing
  end

  def index
  end

  def create
    @listing = Listing.find(params[:id])
    @booking = Booking.new(booking_params)
    @booking.save
    @booking_date = booking_params[:booking_date]
    @blocked_dates = convert_range_to_array(@booking_date)
    @blocked_dates.each do |date|
      @availabilities = Availability.create(available: false, date: date, listing: @listing)
    end
    redirect_to listings_path(@listings)
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :listing_id, :booking_date)
  end

  def convert_range_to_array(str)
    p a = str.split(" to ")
    p a.map { |date| date.to_date }
    p (a[0]..a[1]).to_a
  end
end
