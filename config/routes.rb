Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root :to => 'homes#top'
  get 'home/about' => 'homes#about'
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォローを外す
  devise_for :users

  resources :books,only: [:new, :index, :show, :create, :edit, :destroy, :update] do
  	resources :book_comments,only: [:create, :destroy]
  	resource :favorites,only: [:create, :destroy]
  end
  resources :users,only: [:show,:index,:edit,:update]
  resources :relationships, only: [:create, :destroy, :index, :follow, :unfollow]
end
