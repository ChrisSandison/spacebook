class SpacesController < ApplicationController

  before_filter :lookup_province, only: :index
  before_filter :lookup_space, only: :show

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)

    if @space.save
      flash[:notice] = "Space #{params[:space][:name]} created!"
      redirect_to root_path
    else
      # TODO - color error classes
      render :new, status: 403
    end
  end

  def index 
    @spaces = Space.where(province: @province.region_code).all
  end

  def show
  end

  private

  def space_params
    params.require(:space).permit(:name, :city, :address, :province, :contact_name, :contact_email, :contact_number, :content)
  end
  
end