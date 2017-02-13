class LipsticksController < ApplicationController

  def index
    @lipsticks = Lipstick.all
  end

  def show
    @lipstick = Lipstick.find(params[:id])
  end
end
