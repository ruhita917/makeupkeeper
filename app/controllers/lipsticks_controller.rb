class LipsticksController < ApplicationController

  def index
    @lipsticks = Lipstick.all
  end

  def show
    @lipstick = Lipstick.find(params[:id])
    @reviews = @lipstick.reviews
    @review = Review.new
    @rating_collection = Review::RATINGS
  end

  private

  def lipstick_params
    params.require(:lipstick).permit(
    :name,
    :brand,
    :image_url,
    :product_link,
    :description
    )
  end
end
