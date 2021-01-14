class UsersController < ApplicationController
  def index
    @users = User.all
    @upcoming_events = current_user.attended_events.upcoming
    @past_events = current_user.attended_events.previous
  end

  def show
    @user = User.find(params[:id])
    @user = current_user
  end
end
