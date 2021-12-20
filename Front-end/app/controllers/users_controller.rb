class UsersController < ApplicationController
    skip_before_action :authenticate_, only: [:login, :create]

    def login
        response = request_api("http://localhost:8080/auth/login", "post", {email: params[:email], password: params[:password]})
        if(response.code < "400")
            cookies[:auth_token] = response.body.split("\"")[7]
            redirect_to '/'
        else
            redirect_to '/'
        end
    end

    def index
    end

      def create
        response = request_api("http://localhost:8080/signup", "post", {email: params[:email], name: params[:name], password: params[:password], confirm_password: params[:confirm_password], role: params[:role]})
        if(response.code < "400")
            cookies[:auth_token] = response.body.split("\"")[7]
            redirect_to '/'
        else
            redirect_to '/'
        end
    end

      def vet_pets
        response = request_api("http://localhost:8080/vet_pets", "post", nil)
        @pets = JSON.parse response.body
      end

      def vet_appointments
        response = request_api("http://localhost:8080/vet_appointments", "post", nil)
        @appointments = JSON.parse response.body
      end

      def vet_pet_appointment
        response = request_api("http://localhost:8080/vet_pet_appointment", "post", {pet_id: params[:id]})
        json_array = JSON.parse response.body
        @pet = json_array.first
        @appointments = json_array.last
      end

      def vet_registration
        response = request_api("http://localhost:8080/vet_registration", "post", nil)
        redirect_to vet_pet_appointment_path(id: params[:pet_id])
      end

      private
      def user_params
        params.require(:user).permit(:name)
      end
end
