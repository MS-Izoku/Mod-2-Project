Rails.application.routes.draw do
  resources :likes , only: [:create , :destroy]
  resources :user_goals
  resources :comments , only: [:new , :create , :destroy]
  resources :progress_updates
  resources :goals
  resources :users, except: :index

  get '/login' , to: 'sessions#new' , as: 'login'
  post '/login' , to: 'sessions#create'
  delete '/logout' , to: 'sessions#destroy'


  post '/progress_updates/:id' , to: 'progress_updates#post_comment' , as: 'post_comment'
  #delete '/progress_updates/:id' , to: 'progress_updates#delete_comment' , as: 'remove_comment'
  root to: 'progress_updates#index' , as: 'feed'
  
  patch '/user_goals/:id' , to: 'user_goals#complete' , as: 'complete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
