class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    #create new listing
    @listing = Listing.new(listing_params)
    #get params
    #redirect to new listing page
  end

  def show
    @listing = Listing.find(params[:id])
  end

  private

  def listing_params
    params(:listing).require(:title, :description, :price_per_day)
  end
end
