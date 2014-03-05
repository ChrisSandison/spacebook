class ReviewsController < ApplicationController

  before_filter :lookup_space, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = @space.reviews.create(review_params)

    if @review.save
      flash[:notice] = "Review for #{@space.name} created!"
      redirect_to space_path(@space.id)
    else
      render :new, status: 403
    end
  end

  private

    def review_params
      params.require(:review).permit(:created_by_name, :content)
    end
end
