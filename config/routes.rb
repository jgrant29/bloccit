Rails.application.routes.draw do

  devise_for :users
    resources :users, only: [:update]
  resources :advertisement
  resources :questions
  
  resources :topics do 
    resources :posts, :summaries, except: [:index]
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end