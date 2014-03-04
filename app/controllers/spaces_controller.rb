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

  def lookup_province
    if Region.where("country_id = ? AND region_code = ?", 1, params[:province]).blank?
      flash[:error] = "Province not found" # TODO get this error message working
      redirect_to root_path
    else
      @province = Region.where("country_id = ? AND region_code = ?", 1, params[:province]).first
    end
  end

  def lookup_space
    if Space.find(params[:id]).blank?
      flash[:error] = "Space not found"
      redirect_to root_path
    else
      @space = Space.find(params[:id])
    end
  end
end