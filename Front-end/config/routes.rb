Rails.application.routes.draw do
  post 'login', to: 'users#login'
  post 'create_account', to: 'users#create'
  root "application#index"
  post 'register', to: "pets#register"
  post 'pet_add', to: "pets#create" # needs testing till below
  post 'register', to: "pets#register"
  #take registration of pets?
  post 'appointment_create', to: "appointments#create" # requires testing up till here
  get 'pets_list', to: "pets#index" # requires json understanding
  get 'pet_show', to: "pets#show"
  get 'vet_pets', to: "users#vet_pets"
  get 'vet_appointments', to: "users#vet_appointments"
  get 'vet_pet_appointment', to: "users#vet_pet_appointment"
end







# Rails.application.routes.draw do
#   resources :users do
#     resources :pets
#   end

#   root 'application#index'

#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# end

