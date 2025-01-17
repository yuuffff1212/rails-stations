Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'movies#index'
  resources :movies, only: :index do
  end

  namespace :admin do
    resources :movies, only: %i[index new create edit update destroy]
  end
end
