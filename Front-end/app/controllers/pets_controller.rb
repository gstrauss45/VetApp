class PetsController < ApplicationController
    def index
        response = request_api("http://localhost:8080/pets_list", "get", nil)
        json_array = JSON.parse response.body
        @pets = json_array.first
        @vets = json_array.last
        @array = @vets.map { |div| [div["name"], div["id"]] }
      end

      def new
        #   @pet = Pet.new
        #   authorize @pet
      end

      def create
        response = request_api("http://localhost:8080/pet_add", "post", {name: params[:name]})
        redirect_to root_path
      end

      def show
        response = request_api("http://localhost:8080/pet_show", "get", {id: params[:pet_id]})
        json_array = JSON.parse response.body
        @pet = json_array.first
        @appointments = json_array.second
        @vet = json_array.last
        #   @pet = Pet.find(params[:id])
        #   if @pet.vet_id
            # @vet = User.find(@pet.vet_id)
        #   end
        #   @vets = User.where(role: 'vet').map { |div| [div.name, div.id] }
        #   @appointment = Appointment.new
        #   @appointments = Appointment.all.where(pet_id: @pet.id)
        #   authorize @pet
      end

      def update
        #   @pet = Pet.find(params[:id])
        #   if @pet.update(pet_params)
        #     redirect_to [current_user, @pet]
        #   else
        #     render :edit
        #   end
      end

      def destroy
        #   @pet = Pet.find(params[:id])
        #   authorize @pet
        #   @pet.destroy
        #   redirect_to root_path
      end

      def edit
        #   @pet = Pet.find(params[:id])
        #   authorize @pet
      end

      def register
        response = request_api("http://localhost:8080/register", "post", {pet_id: params[:pet_id], vet_id: params[:vet_id]})
        # @pet = Pet.find(params[:pet_id])
        # @pet.vet_id = params[:vet_id]
        # @pet.save
        # redirect_to [current_user, current_user.pets.find(params[:pet_id])]
      end

      private
      def pet_params
        params.require(:pet).permit(:name, :user_id)
      end
end
