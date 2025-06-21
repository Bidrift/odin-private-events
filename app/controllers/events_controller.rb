class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update]
    def index
        @events = Event.all.order(:time)
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.events.build(event_params)
        if @event.save
            redirect_to event_path
        else
            render 'new', status: :unprocessable_entity
        end
    end
    
    def show
        @event = Event.find(params[:id])
    end

    def edit
        @event = Event.find(params[:id])
    end

    def update
        @event = Event.find(params[:id])
        if @event.update(event_params)
            redirect_to event_path
        else
            render 'edit', status: :unprocessable_entity
        end
    end
    private

    def event_params
        params.expect(event: [:name, :description, :time, :location])
    end
end
