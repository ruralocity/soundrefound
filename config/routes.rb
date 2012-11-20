Soundrefound::Application.routes.draw do  root to: 'flyers#index'
  resources :flyers

  root to: "flyers#index"
end