Rails.application.routes.draw do
  resources :likes , only: [:create , :destroy]
  resources :user_goals
  resources :comments , only: [:new , :create , :destroy]
  resources :progress_updates
  resources :goals
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
