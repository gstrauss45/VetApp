class AppointmentsController < ApplicationController

    def create
        response = request_api("http://localhost:8080/appointment_create", "post", {pet_id: params[:pet_id], vet_id: params[:vet_id], date: params[:date]})
        # Appointment.create(appointment_params)
        # redirect_to [current_user, Pet.find(params[:appointment][:pet_id])]
    end

    private
    def appointment_params
        params.require(:appointment).permit(:pet_id, :vet_id, :date)
    end
end
