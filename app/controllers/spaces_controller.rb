class SpacesController < ApplicationController

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)

    if @space.save?
      flash[:notice] = "Space #{params[:space][:name]} created!"
      redirect_to root_path
    else
      # TODO - color error classes
      render :new, status: 403
    end
  end

  private

  def space_params
    params.require(:space).permit(:name, :contact_name, :contact_email,)
  end
end
