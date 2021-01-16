class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def new
    @attendance = Attendance.new
    @event = Event.find(session[:current_event])
  end

  def create
    @attendance = Attendance.new
    @attendance.attendee = current_user
    @attendance.attended_event_id = session[:current_event]
    if @attendance.save
      flash[:success] = "#{current_user.name} will attend to this event!"
      redirect_to @attendance
    else
      flash[:danger] = 'Something went wrong, you might be already assisting event!'
      @event = Event.find(session[:current_event])
      render 'new'
    end
  end

  def show
    @attenance = Attendance.find(params[:id])
  end

  private

  def attendance_params
    params.permit(:attended_event_id, :attendee_id)
  end
end
