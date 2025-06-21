class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def index
        @events = Event.all
    end

    def new

    end

    def create

    end
end
