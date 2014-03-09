class EventsController < ApplicationController

  before_filter :lookup_space

  def new
    @event = Event.new
  end

  def create
    @event = @space.events.create(event_params)

    if @event.save
      flash[:notice] = "Event #{@event.name} created!"
      redirect_to space_path(@space.id)
    else
      render :new, status: 403
    end
  end

  private

    def event_params
      params.require(:event).permit(:name, :content, :takes_place_at)
    end
end
