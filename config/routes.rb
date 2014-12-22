Dobro::Application.routes.draw do
  resources :posts

  root "pages#home"
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  get 'changelog', to: 'pages#changelog'
  devise_for :users
  resources :users, only: [:edit]

  namespace :admin do
    root "base#index"
    resources :users, only: [:edit]
  end

end
