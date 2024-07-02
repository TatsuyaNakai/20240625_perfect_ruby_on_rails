Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/:provider/callback' => "sessions#create"
  delete '/logout' => "sessions#destroy"

  resources :events, only: %i[new create show edit update destroy] do
    resources :tickets, only: %i[new create destroy]
  end

  resources :retirements, only: %i[new destroy]

  # 上記以外のルーティングが実行された場合は以下にまとめることができます。
  # 記載しない場合でもpublic/配下のファイルが開発環境以外であれば表示されます。
  # match '*path' => 'application#error404', via: :all
end
