class UsersController < ApplicationController
    skip_before_action :authorize_request, only: :create
    def create
      user = User.create!(user_params)
      auth_token = AuthenticateUser.new(user.email, user.password).call
      response = { message: Message.account_created, auth_token: auth_token }
      json_response(response, :created)
    end

    def vet_pets
      @pets = Pet.where(vet_id: current_user.id)
      render json: @pets
    end

    def vet_appointments
      @appointments = Appointment.where(vet_id: current_user.id)
      render json: @appointments
    end

    def vet_pet_appointment
      @pet = Pet.find(params[:pet_id])
      @appointments = Appointment.where(pet_id: params[:pet_id])
      render json: [@pet, @appointments]
    end

    def vet_registration
      render json: "success", status: 200
    end

    private

    def user_params
      params.permit(
        :role,
        :name,
        :email,
        :password,
        :password_confirmation
      )
    end
  end
