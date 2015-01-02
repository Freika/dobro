Rails.application.routes.draw do
  root "pages#home"

  resources :posts
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  get 'changelog', to: 'pages#changelog'
  devise_for :users
  resources :users, only: [:edit]

  namespace :admin do
    root "base#index"
    resources :users, only: [:edit]
    get 'announcements/:id/hide', to: 'announcements#hide', as: 'hide_announcement'
  end
end
