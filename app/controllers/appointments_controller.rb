class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def new
    @appointment = Appointment.new
  end

  def create
    raise params.inspect
    available = Appointment.new(appointment_params).available?
    if available
      redirect_to user_path(user)
    else
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:time_slot_id, :day).merge(user_id: current_user.id)
  end

end
