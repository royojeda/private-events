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

  def destroy
    @attendance = Attendance.where(attendee_id: current_user.id).where(attended_event_id: attendance_params[:attended_event_id]).first

    @attendance.destroy

    redirect_to event_path(attendance_params[:attended_event_id])
  end

  private

  def attendance_params
    params.require(:attendance).permit(:attended_event_id)
  end
end
