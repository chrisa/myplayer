Myplayer::Application.routes.draw do
  root :to => 'programmes#index'
  resources :programmes
end
