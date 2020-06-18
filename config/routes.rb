Rails.application.routes.draw do


  namespace :mypage do
    get 'account/index'
  end
  get 'articles/show'

  get 'entry/new'

  namespace :users do
    get 'basic/index'
  end

  get 'events/index'

  get 'events/show'

  get 'mypage/show'


  root 'index#home'

  get 'index/about'
  
  get 'users/sign_up', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'users/wait', to: 'users#wait'
  get 'users/welcome', to: 'users#welcome'
  get 'users/complete'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'mypage', to: 'mypage#index'
  get 'mypage/profile', to: 'mypage#profile'
  get 'mypage/skill', to: 'mypage#skill'
  get 'mypage/receive', to: 'mypage#receive'
  get 'mypage/favorite', to: 'mypage#favorite'
  get 'mypage/entry' , to: 'mypage#entry'
  get 'articles', to: 'articles#index'
  resources :articles, only:[:show]
  resources :users, only:[:update]
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :generals, only:[:create]

  
  namespace :users do
    get 'basics', to:'basics#index' 
    get 'cores' , to: 'cores#index'
    resources :basics, only:[:create, :update]
    resources :cores, only:[:create, :update]
  end
  
  namespace :mypage do
    get 'general' , to: 'general#index'
    resources :general, only: [:create]
    get 'education' , to: 'education#index'
    resources :education, only: [:create]
    get 'wish' ,to: 'wish#index'
    resources :wish, only:[:create]
    get 'mentarity', to:'mentarity#index'
    resources :mentarity, only: [:create]
    get 'account', to:'account#index'
    resources :account, only: [:create]
  end
  
  get '/companies', to: 'companies#index'
  get 'companies/:id', to: 'companies#show'
  get 'companies/search'
  get '/events', to: 'events#index'
  get 'events/:id', to: 'events#show'
  
  resources :events do
    resources :entry, only: [:new]
    get 'entry/complete'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
