class EventsController < ApplicationController
  def new
  end

  private

  def event_params
    params.require(:event).permit(:location_id, :event_type_id, :date, :start_at, :end_at, :rsvp_url)
  end
end
