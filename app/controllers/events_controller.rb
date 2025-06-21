class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def index
        @events = Event.all
    end
end
