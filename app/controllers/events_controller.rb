class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.build(params[:id])

    if @event.save
      flash[:notice] = 'Event successfully created'
      redirect_to new_event_path
    else
      flash[:notice] = 'Invalid information. Please try again'
      render :new
    end
  end
  def show
    @event = Event.find(params[:id])
  end
  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:event_type,:location,:date,:start_at,:end_at,:rsvp_url)
    end

end
