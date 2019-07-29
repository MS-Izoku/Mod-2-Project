Rails.application.routes.draw do
  resources :likes
  resources :user_goals
  resources :comments
  resources :progress_updates
  resources :goals
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
