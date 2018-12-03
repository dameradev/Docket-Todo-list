Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  resources :items do
    member do
      get :toggle_status
    end
  end
  authenticated :user do
    root to: "items#index", as: "authenticated_root"
  end
  root to: 'pages#home'

end
