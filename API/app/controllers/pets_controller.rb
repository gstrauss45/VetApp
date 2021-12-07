class PetsController < ApplicationController
    def index
        @pets = Pet.all.where(user_id: current_user.id)
        @vets = User.all.where(role: 'vet')
        render json: [@pets, @vets]
        # authorize @pets || @pets.first
      end

      def new
          @pet = Pet.new
        #   authorize @pet
      end

      def create
        if Pet.create(name: params[:name], user_id: current_user.id)
          render status: 201
        else
          render status: 400
        end
      end

      def show
          @pet = Pet.find(params[:id])
          @appointments = Appointment.all.where(pet_id: @pet.id)
          @vet = nil
          if @pet.vet_id
            @vet = User.find(@pet.vet_id)
          end
          render json: [@pet, @appointments, @vet]
          #   authorize @pet
      end

      def update
          @pet = Pet.find(params[:id])
          if @pet.update(pet_params)
            redirect_to [current_user, @pet]
          else
            render :edit
          end
      end

      def destroy
          @pet = Pet.find(params[:id])
        #   authorize @pet
          @pet.destroy
          redirect_to root_path
      end

      def edit
          @pet = Pet.find(params[:id])
        #   authorize @pet
      end

      def register
        pet = Pet.find(params[:pet_id])
        pet.vet_id = params[:vet_id]
        if pet.save
          render status: 201
        else
          render status: 400
        end
      end
end
