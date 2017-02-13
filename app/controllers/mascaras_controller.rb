class MascarasController < ApplicationController

  def index
    @mascaras = Mascara.all
  end

  def show
    @mascara = Mascara.find(params[:id])
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
