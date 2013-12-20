Bloccit::Application.routes.draw do

  devise_for :users

  # resources :posts, :path => 'articles'

  resources :topics do
      resources :posts, except: [:index], :path => 'articles'
  end

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'

end
