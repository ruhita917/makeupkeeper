class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    if params[:eyeshadow_id].present?
       @eyeshadow = Eyeshadow.find(params[:eyeshadow_id])
       @user = current_user.id
       @review = Review.new
       @review.eyeshadow = @eyeshadow
       @rating_collection = Review::RATINGS
    elsif params[:lipstick_id].present?
       @lipstick = Lipstick.find(params[:lipstick_id])
       @review = Review.new
       @review.lipstick = @lipstick
       @rating_collection = Review::RATINGS
    else
       @mascara = Mascara.find(params[:mascara_id])
       @review = Review.new
       @review.mascara = @mascara
       @rating_collection = Review::RATINGS
    end
  end

 def create
   if params[:eyeshadow_id].present?
      @eyeshadow = Eyeshadow.find(params[:eyeshadow_id])
      @user = current_user
      @review = Review.new(params_strong)
      @review.eyeshadow = @eyeshadow
      @review.user = @user
      if @review.save
          flash[:notice] = "Review added successfully"
          redirect_to eyeshadow_path(@eyeshadow)
          # redirect_to controller: 'eyeshadow', action: 'show', id: params[:eyeshadow_id]
      else
          flash[:notice] = @review.errors.full_messages.to_sentence
          @reviews = @eyeshadow.reviews
          @rating_collection = Review::RATINGS
          render '/eyeshadows/show'
        end
    elsif params[:lipstick_id].present?
      @lipstick = Lipstick.find(params[:lipstick_id])
      @user = current_user
      @review = Review.new(params_strong)
      @review.lipstick = @lipstick
      @review.user = @user
      if @review.save
         flash[:notice] = "Review added successfully"
         redirect_to controller: 'lipstick', action: 'show', id: params[:lipstick_id]
      else
        @reviews = @lipstick.reviews
        @rating_collection = Review::RATINGS
        render '/lipsticks/show'
      end
    else
      @mascara = Mascara.find(params[:mascara_id])
      @user = current_user
      @review = Review.new(params_strong)
      @review.mascara = @mascara
      @review.user = @user
      if @review.save
          flash[:notice] = "Review added successfully"
          redirect_to controller: 'mascara', action: 'show', id: params[:mascara_id]
      else
        @reviews = @mascara.reviews
        @rating_collection = Review::RATINGS
        render '/mascaras/show'
      end
  end
end


  private

  # def eyeshadow_params
  #   params.require(:eyeshadow).permit(
  #   :name,
  #   :brand,
  #   :image_url,
  #   :product_link,
  #   :description
  #   )
  # end

   def params_strong
     params.require(:review).permit(
       :rating,
       :body
     )
   end
end
