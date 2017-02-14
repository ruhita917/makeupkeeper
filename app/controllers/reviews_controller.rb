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
       @user = current_user.id
       @review = Review.new
       @review.lipstick = @lipstick
       @rating_collection = Review::RATINGS
    else
      @mascara = Mascara.find(params[:mascara_id])
      @user = current_user.id
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
         redirect_to lipstick_path(@lipstick)
      else
        flash[:notice] = @review.errors.full_messages.to_sentence
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
          redirect_to mascara_path(@mascara)
      else
        flash[:notice] = @review.errors.full_messages.to_sentence
        @reviews = @mascara.reviews
        @rating_collection = Review::RATINGS
        render '/mascaras/show'
      end
    end
  end


  private

   def params_strong
     params.require(:review).permit(
       :rating,
       :body
     )
   end
end
