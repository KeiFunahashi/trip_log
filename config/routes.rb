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
  resources :news, only: [:new,:create]
  resources :bookmarks, only: :index
  resources :favorite, only: :index
  resources :profiles, only:  :show
  resources :trips do
    collection do
      get 'main'
      get 'sub'
      get 'done' # 登録完了後のページ
    end
  end

end
