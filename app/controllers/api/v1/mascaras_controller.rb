class Api::V1::MascarasController < Api::V1::BaseController

  def show
    if params[:mascara_id]
    @mascara = mascara.find(params[:id])
    @reviews = @mascara.reviews
    respond_with @reviews, json: @reviews
    end
  end

end
