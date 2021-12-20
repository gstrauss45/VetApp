Rails.application.routes.draw do
  post 'login', to: 'users#login'
  post 'create_account', to: 'users#create'
  root "application#index"
  post 'register', to: "pets#register"
  post 'pet_add', to: "pets#create"
  post 'register', to: "pets#register"
  post 'appointment_create', to: "appointments#create"
  get 'pets_list', to: "pets#index"
  get 'pet_show', to: "pets#show"
  get 'vet_pets', to: "users#vet_pets"
  get 'vet_appointments', to: "users#vet_appointments"
  get 'vet_pet_appointment', to: "users#vet_pet_appointment"
  post 'vet_registration', to: "users#vet_registration"
end
