Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
   }
   
   root to: 'posts#index'
  resources :posts do
    collection do
      get 'search'
    end
  end
  resources :users, only: [:edit, :show]
  resources :relationships, only: [ :index,:create, :destroy]
  resources :posts do
    post 'add' => 'bookmarks#create'
    delete '/add' => 'bookmarks#destroy'
  end
  resources :bookmarks, only: :index
  resources :favorite, only: :index
  resources :profiles, only:  :show
end
