class AttendancesController < ApplicationController
before_action :require_user, only: %i[new create]

def new
@attendance = Attendance.new
@event = Event.find(session[:current_event])
end

def create
@attendance = Attendance.new
@attendance.attendee = current_user
@attendance.attended_event_id = session[:current_event]
if @attendance.save
	falsh[:success] = "#{current_user.name} will attend to this event!"
	redirect_to event_path(session[:current_event])
else
	flash[:danger]  = 'Something went wrong, you might be already assisting event!'
	@event = Event.find(session[:current_event])
	render 'new'
end
	end

end
