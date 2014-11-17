Wakeup::Application.routes.draw do
  root to: 'static_pages#root'
  resources :users do
    resources :posts, only: [:create]
  end
  resource :session

end
