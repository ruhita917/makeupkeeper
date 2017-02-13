class EyeshadowsController < ApplicationController

  def index
    @eyeshadows = Eyeshadow.all
  end

  def show
    @eyeshadow = Eyeshadow.find(params[:id])
    @reviews = @eyeshadow.reviews
    @review = Review.new
    @rating_collection = Review::RATINGS
  end

  private

  def eyeshadow_params
    params.require(:eyeshadow).permit(
    :name,
    :brand,
    :image_url,
    :product_link,
    :description
    )
  end
end
