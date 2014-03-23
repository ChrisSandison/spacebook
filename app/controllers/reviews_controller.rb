class ReviewsController < ApplicationController

  before_filter :lookup_space

  def new
    @review = Review.new
  end

  def create
    binding.pry
    @review = @space.reviews.create(review_params)

    if @review.save
      redirect_to space_path(@space.id, flash: "new_review")
    else
      render :new, status: 403
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  private

    def review_params
      params.require(:review).permit(:created_by_name, :content, :rating, :event_id, :event_other, :accessabiltity, :would_attend, :would_book)
    end
end
