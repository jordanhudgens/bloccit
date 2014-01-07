Bloccit::Application.routes.draw do

  # custom registration controller for image upload bug
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  # resources :posts, :path => 'articles'

  resources :topics do
      resources :posts, except: [:index], :path => 'articles' do
          resources :comments, only: [:create, :destroy]
      end
  end

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'

end
