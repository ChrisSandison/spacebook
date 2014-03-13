class ReviewsController < ApplicationController

  before_filter :lookup_space

  def new
    @review = Review.new
  end

  def create
    @review = @space.reviews.create(review_params)

    if @review.save
      redirect_to space_path(@space.id, flash: "new_review")
    else
      render :new, status: 403
    end
  end

  private

    def review_params
      params.require(:review).permit(:created_by_name, :content)
    end
end
