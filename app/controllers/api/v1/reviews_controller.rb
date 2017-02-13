class Api::V1::ReviewsController < Api::V1::BaseController

  def index
    if params[:eyeshadow_id].present?
      @eyeshadow = Eyeshadow.find(params[:eyeshadow_id])
      @reviews = @eyeshadow.reviews
      respond_with @reviews, json: @reviews
  end

end
