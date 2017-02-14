class MascarasController < ApplicationController

  def index
    @mascaras = Mascara.all
  end

  def show
    @mascara = Mascara.find(params[:id])
    @reviews = @mascara.reviews
    @review = Review.new
    @rating_collection = Review::RATINGS
  end

  private

  def mascara_params
    params.require(:mascara).permit(
    :name,
    :brand,
    :image_url,
    :product_link,
    :description
    )
  end
end
