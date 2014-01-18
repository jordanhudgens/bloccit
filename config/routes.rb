Bloccit::Application.routes.draw do

  # custom registration controller for image upload bug
  devise_for :users, :controllers => { :registrations => "users/registrations", omniauth_callbacks: "users/omniauth_callbacks" }
  # resources :posts, :path => 'articles'

  #user profiles
  resources :users, only: [:show, :index]

  resources :posts, only: [:index]

  resources :topics do
      resources :posts, except: [:index], controller: 'topics/posts', :path => 'articles' do
          resources :comments, only: [:create, :destroy]
          get '/up-vote', to: 'votes#up_vote', as: :up_vote
          get '/down-vote', to: 'votes#down_vote', as: :down_vote
          resources :favorites, only: [:create, :destroy]
      end
  end

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'

end
