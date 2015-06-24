Rails.application.routes.draw do

  resources :advertisement
  resources :posts
  resources :questions

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end