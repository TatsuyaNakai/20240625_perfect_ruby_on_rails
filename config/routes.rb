Rails.application.routes.draw do
  get '/books/:id' => 'books#show'
  delete '/books/:id' => 'books#delete'

  resources :publishers
  resources :profile, only: %i[show edit update]
end
