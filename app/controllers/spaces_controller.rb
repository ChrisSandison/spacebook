class SpacesController < ApplicationController

  before_filter :lookup_province, only: :index
  before_filter :lookup_space, only: [:show, :edit, :update, :contact, :send_email]

  def new
    @space = Space.new
    if params[:province].present? && Region.exists?(params[:province])
      @space.province = Region.get_region_code_from_name(params[:province])
    end
  end

  def create
    @space = Space.new(space_params)

    if @space.save
      redirect_to space_path(id: @space.id)
    else
      render :new, status: 403
    end
  end

  def index 
    @spaces = Space.where(province: @province.region_code).all
  end

  def show
    load_alert
    @reviews = @space.reviews.order(created_at: :asc)
     if @reviews.count > 15
      page = params[:page] || 1
      @reviews = @space.reviews.paginate(page: page, per_page: 15)
      @paginate_reviews = true
    end

    @events = @space.events.order(takes_place_at: :desc)
    if @events.count > 10
      page = params[:page] || 1
      @events = @space.events.paginate(page: page, per_page: 10)
      @paginate_events = true
    end
  end

  def edit
  end

  def update
    if @space.update(space_params)
      redirect_to space_path(id: @space.id, flash: "updated")
    else
      render :edit, status: 403
    end
  end

  def contact
    @contact_form = ::ContactForm.new(space: @space)
  end

  def send_email
    @contact_form = ::ContactForm.new(space: @space, reply_email: contact_email_param, email_message: contact_message_param)
    @contact_form.submit
    redirect_to space_path(id: @space.id, flash: "sent_email")
  end

  private

  def space_params
    params.require(:space).permit(:name, :city, :address, :province, :contact_name, :contact_email, :contact_number, :content, :website)
  end

  def contact_email_param
    params.require(:contact_form).permit(:reply_email)
  end

  def contact_message_param
    params.require(:contact_form).permit(:email_message)
  end

  def load_alert
    instance_variable_set("@alert_text", Space.alert_messages[params[:flash]])
  end
  
end