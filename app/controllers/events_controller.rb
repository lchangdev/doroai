class EventsController < ApplicationController

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

  private

  def event_params

  end
end
