class ReviewsController < ApplicationController
  before_action :set_listing, only: [ :index, :new, :create ]

  def new
    @review = Review.new
  end

  def index
    @reviews = Review.all
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @review = Review.new(review_params)
    # @review.listing = @listing

    if @review.save
      redirect_to listing_path(@listing)
    else
      render "listings/show", status: :unprocessable_entity
    end
  end


  private

  def review_params
    params.require(:review).permit(:content, :listing_id)
  end


  def set_listing
    @listing = Listing.find(params[:listing_id])
  end
end
