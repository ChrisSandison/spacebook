class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def lookup_province
    if Region.where("country_id = ? AND region_code = ?", 1, params[:province]).blank?
      flash[:error] = "Province not found" # TODO get this error message working
      redirect_to root_path
    else
      @province = Region.where("country_id = ? AND region_code = ?", 1, params[:province]).first
    end
  end

  def lookup_space
    space_id = params[:space_id] || params[:id]
    if Space.find(space_id).blank?
      flash[:error] = "Space not found"
      redirect_to root_path
    else
      @space = Space.find(space_id)
    end
  end
end
