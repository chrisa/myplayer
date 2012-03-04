Myplayer::Application.routes.draw do
  root :to => 'feeds#index'
  resources :feeds
  resources :programmes
  resources :plays
end
