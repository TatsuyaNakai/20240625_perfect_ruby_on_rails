Rails.application.routes.draw do
  root 'welcome#index'

  get 'status' => 'status#show', defaults: { format: :json }

  get '/auth/:provider/callback' => "sessions#create"
  delete '/logout' => "sessions#destroy"

  resources :events do
    resources :tickets
  end

  resources :retirements, only: %i[new destroy]
end
