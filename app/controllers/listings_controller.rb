class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Listing.all

    @markers = @listings.geocoded.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {listing: listing})
      }
    end
  end

  def new
    @listing = Listing.new
  end

  def create
    # create new listing
    @listing = Listing.new(listing_params)
    # get params
    if @listing.save
      redirect_to listing_path(@listing)
    end
    # redirect to new listing page
    #
  end

  def show
    @listing = Listing.find(params[:id])
    @booking = Booking.where(listing_id: @listing.id)

    @markers = [
      build_listing_object(@listing)
    ]
    @center = [ @listing.longitude, @listing.latitude ]
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    redirect_to listing_path(@listing)
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path
  end

  def mine
    @listings = Listing.where(user_id: current_user.id)
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
    @user = User
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :price_per_day, :photo, :user_id, :address)
  end

  private
    def build_listing_object(listing)
      {
        marker_html: render_to_string(partial: "marker"),
        info_window_html: render_to_string(partial: "info_window", locals: {listing: listing}),
        lat: listing.latitude,
        lng: listing.longitude
      }
    end
end
