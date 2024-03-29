Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :videos do
    resource :relationships,only: [:create,:destroy]
    resource :favorites,only: [:create,:destroy]
    collection do
      get 'search'
    end
  end

  root 'videos#index'

  resources :people do
    resources :tags,only: [:create]
    resources :penalties,only: [:create]
    collection do
      get 'search'
    end
  end

  resources :penalties do
    collection do
      get 'search'
    end
  end

  resources :tags do
    collection do
      get 'search'
    end
  end

  resources :places do
    collection do
      get 'search'
    end
  end

  resources :musics do
    collection do
      get 'search'
    end
  end
  
end
