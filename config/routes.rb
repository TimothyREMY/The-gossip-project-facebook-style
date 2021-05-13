Rails.application.routes.draw do

  root 'gossips#index'
  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'
  get 'city', to: 'static_pages#city'
  
  resources :gossips do
    resources :comments
    resources :likes
  end
  resources :users
  resources :sessions,only:[:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
