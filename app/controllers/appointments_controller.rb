class AppointmentsController < ProtectedController
  before_action :authenticate
  before_action :set_appointment, only: [:show, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = @current_user.appointments

    render json: @appointments
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
    render json: @appointment
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = current_user.appointments.build(appointment_params)

    if @appointment.save
      render json: @appointment, status: :created, location: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    @appointment = Appointment.find(params[:id])

    if @appointment.update(appointment_params)
      head :no_content
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy

    head :no_content
  end

  private

    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:what, :where, :when, :user_id)
    end
end
