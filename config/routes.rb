Bloccit::Application.routes.draw do

  devise_for :users
  resources :posts, :path => 'articles'

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'

  resources :my_edit => '/articles/edit', :controller => 'posts', :action => 'edit'
end
