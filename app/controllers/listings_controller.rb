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

  def under100
    @listings = Listing.where("price_per_day < ?", 100)
  end

  def pet_friendly
    @listings = Listing.where(pet_friendly: true)
  end

  def family
    @listings = Listing.where("capacity > ?", 2)
  end

  def fortwo
    @listings = Listing.where(capacity: 2)
  end

  def wifi
    @listings = Listing.where(wifi: true)
  end

  def kitchen_bbq
    @listings = Listing.where(kitchen: true).or(Listing.where(bbq: true))
  end

  def shower_bathroom
    @listings = Listing.where(shower: true).or(Listing.where(bathroom: true))
  end

  def luxury
    @listings = Listing.where(luxury: true)
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
    @user = User
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :price_per_day, :photo, :user_id, :address)
  end

  def build_listing_object(listing)
    {
      marker_html: render_to_string(partial: "marker"),
      info_window_html: render_to_string(partial: "info_window", locals: {listing: listing}),
      lat: listing.latitude,
      lng: listing.longitude
    }
  end
end
