class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def create
    @attendance = Attendance.new(attendance_params)
    @attendance.attendee = current_user

    if @attendance.save
      redirect_to user_path(current_user.id)
    else
      render "events/show", status: :unprocessable_entity
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:attended_event_id)
  end
end
