class BookingsController < ApplicationController
  def new
    @listing = Listing.find(params[:id])
    @booking = Booking.new
    @booking.listing = @listing
  end
end
