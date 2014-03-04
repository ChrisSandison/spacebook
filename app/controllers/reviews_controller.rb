class ReviewsController < ApplicationController

  before_filter :lookup_space, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create

  end

end
