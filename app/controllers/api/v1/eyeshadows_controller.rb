class Api::V1::EyeshadowsController < Api::V1::BaseController

  def show
    if params[:eyeshadow_id]
    @eyeshadow = Eyeshadow.find(params[:id])
    @reviews = @eyeshadow.reviews
    respond_with @reviews, json: @reviews
    end
  end
  
end
