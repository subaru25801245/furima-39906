Rails.application.routes.draw do
  get 'buy_records/index'
  get 'buy_records/create'
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :buy_records, only: [:index, :create]
  end
end