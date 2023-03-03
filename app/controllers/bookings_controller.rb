class BookingsController < ApplicationController
  def new
    @user = current_user
    @listing = Listing.find(params[:id])
    @booking = Booking.new
    @booking.listing = @listing
    @availability = Availability.where(booking_id: @booking)
  end

  def index
    @bookings = Booking.where(listing: @listing)
    @listing = Listing.find(params[:id])
  end


  def create
    @listing = Listing.find(params[:id])
    @booking_date = booking_params[:booking_date]
    p @blocked_dates = convert_range_to_array(@booking_date)
    @blocked_dates.each do |date|
      @booking = Booking.create(user_id: current_user.id, listing: @listing, booking_date: date)
      @availabilities = Availability.create(available: false, date: date, booking_id: @booking.id, listing_id: @booking.listing_id)
    end
    redirect_to listing_path(@listing), notice: "🎉 Successfully created booking 🎉"
  end

  def destroy
    @booking = Booking.find(params[:id])
    @listing = Listing.find(@booking.listing_id)
    @booking.destroy
    redirect_back(fallback_location: root_path)
  end

  def mine
    @user = current_user
    @bookings = Booking.where(user_id: @user.id)
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :listing_id, :booking_date)
  end

  def convert_range_to_array(str)
    if str == ""
      return ""
    else
      a = str.split(" to ")
      a.map { |date| date.to_date }
      (a[0]..a[1]).to_a
    end
  end
end
