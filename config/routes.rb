Rails.application.routes.draw do
  root "homes#top"
  devise_for :admins, controllers: {
    sessions:'admins/sessions'
  }
  namespace :admins do
    resources :genres
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :users do
    get 'searches/search' => 'searches#search', as: 'search'
    resources :books
    devise_for :users, controllers: {
      sessions:      'users/sessions',
      passwords:     'users/passwords',
      registrations: 'users/registrations',
      omniauth_callbacks: 'users/omniauth_callbacks'
    }
    resources :users
    resources :books do
      resource :book_comments, only: [:create]
      resources :book_comments, only: [:destroy]
      resource :favorites, only: [:create, :destroy]
    end
    post 'follow/:id' => 'relationships#follow', as: 'follow'
    post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
    get 'users/:id/follows' => 'users#follows', as: 'follows'
    get 'users/:id/followers' => 'users#followers', as: 'followers'
  end
end
