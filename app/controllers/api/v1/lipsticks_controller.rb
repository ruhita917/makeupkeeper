class Api::V1::LipsticksController < Api::V1::BaseController

  def show
    if params[:lipstick_id]
    @lipstick = lipstick.find(params[:id])
    @reviews = @lipstick.reviews
    respond_with @reviews, json: @reviews
    end
  end

end
