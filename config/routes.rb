Rails.application.routes.draw do
  get '/', to: redirect('/maze/0/0/N')
  get '/maze/:x/:y/:direction', to: 'maze#maze', as: 'maze'
  resources :rooms
  resources :passages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
