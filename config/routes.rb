Rails.application.routes.draw do

  get 'edit_mail/index'
  get 'admin_user/index'
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
  get 'mypage/edit_favorite', to: 'mypage#edit_favorite'
  get 'mypage/entry' , to: 'mypage#entry'
  get 'articles', to: 'articles#index'
  get 'partner_page/dashboard', to: 'partner_page#index'
  get 'partner_page/profile', to: 'partner_page#profile'
  get 'entry/new'
  get 'password_resets/wait'
  get 'password_resets/complete'
  resources :articles, only:[:show]
  resources :users, only:[:update]
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :generals, only:[:create]
  resources :user_programmings, only: [:new, :create, :edit, :update, :destroy]
  resources :user_eikens, only: [:new, :create, :edit, :update]
  resources :user_toeics, only: [:new, :create, :edit, :update]
  resources :user_toefls, only: [:new, :create, :edit, :update]
  resources :user_languages, only: [:new, :create, :edit, :update, :destroy]
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
    get 'notifications', to: 'notifications#index'
    resources :notifications, only: [:show]
    get 'deactivation', to: 'deactivation#index'
    resources :deactivation, only: [:create]
    get 'mail_type', to: 'mail_type#index'
    resources :mail_type, only: [:create]
  end
  
  namespace :partner_page do
    get 'apply', to: 'apply#index' 
    get 'event', to: 'event#index'
    resources :events, only: [:edit]
    put 'events/:id', to: 'events#update', as: 'update_event'
    resources :entry, only: [:new, :create]
    resources :internship, only: [:new, :create]
    resources :seminar, only: [:new, :create]
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
  
  namespace :admin_page do
    get 'events', to: 'events/index'
    resources :events, only: [:new, :create, :edit, :update]
    resources :events do
      collection { post :import }
    end
    get 'companies', to: 'companies#index'
    resources :companies , only: [:new, :create, :edit, :update, :show]
    resources :companies do
      collection { post :import }
      get 'edit_general', to: 'edit_general#index'
      resources :edit_general ,only: [:create]
    end
    get 'articles', to: 'articles#index'
    resources :articles, only: [:new, :create, :edit, :update]
    resources :article_images, only: [:create]
  end
  
  namespace :infos do
    get 'privacy', to: 'privacy#index'
    get 'terms', to: 'terms#index'
    get 'contents_policy', to: 'contents_policy#index'
  end
  
  get '/companies', to: 'companies#index'
  get 'companies/:id', to: 'companies#show'
  post '/companies/:id/like', to: 'companies#like'
  delete '/companies/:id/dislike', to: 'companies#dislike'
  delete '/companies/:id/unfavorite', to: 'companies#unfavorite'
  get '/events', to: 'events#index'
  get 'events/:id', to: 'events#show'
  get 'special_link', to: 'special_link#index'
  get 'search' , to: 'search#index'
  
  resources :events do
    resources :entry, only: [:new, :create]
    get 'entry/complete'
    get 'entry/edit_schedule'
    get 'entry/cancel'
    post 'entry/edit_complete'
    delete 'entry/cancel', to: 'entry#destroy'
    get 'entry/complete_cancel'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
