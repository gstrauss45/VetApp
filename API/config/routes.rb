Rails.application.routes.draw do
  post 'index', to: 'application#index'
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  post 'pet_add', to: "pets#create" # needs testing till below
  post 'register', to: "pets#register"
  #take registration of pets?
  post 'appointment_create', to: "appointments#create" # requires testing up till here
  get 'pets_list', to: "pets#index" # requires json understanding
  get 'pet_show', to: "pets#show"
  post 'vet_pets', to: "users#vet_pets"
  post 'vet_appointments', to: "users#vet_appointments"
  post 'vet_pet_appointment', to: "users#vet_pet_appointment"
end
