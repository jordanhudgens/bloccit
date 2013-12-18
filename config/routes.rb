Bloccit::Application.routes.draw do

  devise_for :users
  resources :posts, :path => 'articles'

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'

  match "my_edit/:id" => 'posts#my_edit', via: :get, as: "my_edit_post"
end
