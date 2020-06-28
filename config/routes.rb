Rails.application.routes.draw do
  
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  root to: "toppages#index"
  
  get "signup", to: "users#new"
  resources :users, only: [:index, :show, :new, :create]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :wishes
  resources :nondas
  resources :stocks

  # wishでstockボタン押下時の遷移設定　###
  get 'wishes/:id/stock', to: 'wishes#stock', as: 'stock_wish'
  get 'stocks/:id/new_from_wish', to: 'stocks#new_from_wish', as: 'stock_from_wish'
  
  # wishでnondaボタン押下時の遷移設定　###
  get 'wishes/:id/nonda', to: 'wishes#nonda', as: 'nonda_wish'
  get 'nondas/:id/new_from_wish', to: 'nondas#new_from_wish', as: 'nonda_from_wish'
  
  # stockでnondaボタン押下時の遷移設定　###
  get 'stocks/:id/nonda', to: 'stocks#nonda', as: 'nonda_stock'
  get 'nondas/:id/new_from_stock', to: 'nondas#new_from_stock', as: 'nonda_from_stock'
end
