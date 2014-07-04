class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Success."
      redirect_to events_path
    else
      flash[:notice] = "Error."
      render :new
    end
  end

  def home

  end

  private

  def event_params
    params.require(:event).permit(:event_date, :name, :description)
  end
end
