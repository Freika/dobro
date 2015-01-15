Rails.application.routes.draw do
  root 'pages#home'

  resources :posts
  resources :users, only: [:edit]

  get 'posts/period/last_week', to: 'posts#last_week', as: 'last_week'
  get 'posts/period/last_month', to: 'posts#last_month', as: 'last_month'
  get 'posts/week/:year/:week', to: 'posts#week', as: 'week'
  get 'posts/month/:year/:month', to: 'posts#month', as: 'month'
  get 'posts/period/weeks', to: 'posts#period', as: 'period_list'

  get 'home', to: 'pages#home', as: 'home'
  get 'inside', to: 'pages#inside', as: 'inside'
  get 'changelog', to: 'pages#changelog'
  devise_for :users

  namespace :admin do
    root 'base#index'
    resources :users, only: [:edit]
  end
end
