class EventsController < ApplicationController
before_action :authenticate_user!
def index
@events = Event.all.order('created_at DESC')
end

def new
@event = Event.new
	end

def create
@event = current_user.created_events.build(event_params)
if @event.save
	redirect_to @event
	flash[:success] = 'Event was created successfully!'
else
	flash[:danger] = "Event wasn't created! Try again!"
	render 'new'
end
end

def show
@event = Event.find(params[:id])
session[:current_event] = @event.id
	end

	private

	def event_params
params.require(:event).permit(:start_time, :end_time, :title, :description)
	end

end
