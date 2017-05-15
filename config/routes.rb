Rails.application.routes.draw do
  get 'maze/index'

  resources :rooms
  resources :passages
  get '/maze/:x/:y/:direction', to: 'maze#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
