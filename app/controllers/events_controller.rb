class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def index
        @events = Event.all.order(:time)
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.events.build(event_params)
        if @event.save
            redirect_to events_path
        else
            render 'new', status: :unprocessable_entity
        end
    end
    
    def show
        @event = Event.find(params[:id])
    end
    private

    def event_params
        params.expect(event: [:name, :description, :time, :location])
    end
end
