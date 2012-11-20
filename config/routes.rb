Soundrefound::Application.routes.draw do
  resources :flyers
  resources :bands, only: [ :index, :show ]

  root to: "flyers#index"
end