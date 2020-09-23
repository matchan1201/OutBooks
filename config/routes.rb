Rails.application.routes.draw do
  root "homes#top"
  get "about" => "homes#about"
  devise_for :admins, controllers: {
    sessions:      'admins/sessions'
  }
  namespace :admins do
    resources :genres
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :users do
    resources :books
    devise_for :users, controllers: {
      sessions:      'users/sessions',
      passwords:     'users/passwords',
      registrations: 'users/registrations'
    }
    resources :users
    resources :books
  end
end
