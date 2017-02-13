class EyeshadowsController < ApplicationController

  def index
    @eyeshadows = Eyeshadow.all
  end

  def show
    @eyeshadow = Eyeshadow.find(params[:id])
    @reviews = @eyeshadow.reviews
    # @reviews = Review.where(eyeshadow_id: params[:id])
    @review = Review.new
    @rating_collection = Review::RATINGS
    # @users = User.all
    # @usershash = Hash.new
    # @users.each do |user|
    #   @usershash[user.id] = user.username
    # end
  end

  # def create
  #   @eyeshadow = Eyeshadow.find(params[:eyeshadow_id])
  #   @review = Review.new(eyeshadow_params)
  #   @review.eyeshadow = @eyeshadow
  #   if @review.save
  #     flash[:notice] = "Review added successfully"
  #     redirect_to controller: 'eyeshadow', action: 'show', id: params[:eyeshadow_id]
  #   else
  #     flash[:notice] = @review.errors.full_messages.to_sentence
  #     @reviews = @eyeshadow.reviews
  #     @rating_collection = Review::RATINGS
  #     render '/eyeshadow/show'
  #   end
  # end

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
