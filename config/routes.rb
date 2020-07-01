Rails.application.routes.draw do


  
  namespace :mypage do
    get 'notification/index'
  end
  get 'articles/show'

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
  get 'partner_page/dashboard', to: 'partner_page#index'
  get 'partner_page/profile', to: 'partner_page#profile'
  get 'entry/new'
  resources :articles, only:[:show]
  resources :users, only:[:update]
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :generals, only:[:create]
  resources :user_programmings, only: [:new, :create, :edit, :update]
  resources :user_eikens, only: [:new, :create, :edit, :update]
  resources :user_toeics, only: [:new, :create, :edit, :update]
  resources :user_toefls, only: [:new, :create, :edit, :update]
  resources :user_languages, only: [:new, :create, :edit, :update]
  resources :user_internships, only: [:new, :create, :edit, :update]
  resources :user_experiences, only: [:new, :create, :edit, :update]

  
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
    get 'notification', to:'notification#index'
    resources :notification, only: [:show]
  end
  
  namespace :partner_page do
    get 'apply', to: 'apply#index' 
    get 'event', to: 'event#index'
    resources :entry, only: [:new, :create, :edit, :update]
    resources :internship, only: [:new, :create,:edit, :update]
    resources :seminar, only: [:new, :create, :edit, :update]
    get 'edit_general', to: 'edit_general#index'
    resources :edit_general, only: [:create]
    get 'edit_unique', to: 'edit_unique#index'
    resources :edit_unique, only: [:create]
    get 'edit_requirements', to: 'edit_requirements#index'
    resources :edit_requirements, only: [:create]
  end
  
  namespace :partner_user do
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
  end
  
  get '/companies', to: 'companies#index'
  get 'companies/:id', to: 'companies#show'
  post '/companies/:id/like', to: 'companies#like'
  get 'companies/search'
  get '/events', to: 'events#index'
  get 'events/:id', to: 'events#show'
  get 'special_link', to: 'special_link#index'
  
  resources :events do
    resources :entry, only: [:new, :create]
    get 'entry/complete'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
