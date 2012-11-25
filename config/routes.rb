Soundrefound::Application.routes.draw do
  devise_for :users

  resources :flyers
  resources :bands, only: [ :index, :show ]
  resources :venues, only: [ :index, :show ]

  root to: "flyers#index"
end