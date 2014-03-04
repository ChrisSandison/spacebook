class SpacesController < ApplicationController

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

  private

  def space_params
    ap params.as_json
    params.require(:space).permit(:name, :city, :address, :province, :contact_name, :contact_email, :contact_number, :content)
  end
end