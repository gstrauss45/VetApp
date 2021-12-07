class AppointmentsController < ApplicationController
    def create
        if Appointment.create(appointment_params)
            render status: 201
        else
          render status: 400
        end
    end

    private
    def appointment_params
        params.require(:appointment).permit(:pet_id, :vet_id, :date)
    end
end
