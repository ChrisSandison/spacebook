class SpacesController < ApplicationController

  before_filter :lookup_province, only: :index
  before_filter :lookup_space, only: [:show, :edit, :update]

  def new
    @space = Space.new
    if params[:province].present? && Region.exists?(params[:province])
      @space.province = Region.get_region_code_from_name(params[:province])
    end
  end

  def create
    @space = Space.new(space_params)

    if @space.save
      flash[:notice] = "Space #{params[:space][:name]} created!"
      redirect_to root_path
    else
      render :new, status: 403
    end
  end

  def index 
    @spaces = Space.where(province: @province.region_code).all
  end

  def show
    @reviews = @space.reviews
     if @reviews.count > 5
      page = params[:page] || 1
      @reviews = @space.reviews.paginate(page: page, per_page: 5)
      @paginate = true
    end
  end

  def edit
  end

  def update
    if @space.update(space_params)
      flash[:notice] = "#{@space.name} Updated!"
      redirect_to space_path(id: @space.id)
    else
      render :edit, status: 403
    end
  end

  private

  def space_params
    params.require(:space).permit(:name, :city, :address, :province, :contact_name, :contact_email, :contact_number, :content)
  end
  
end