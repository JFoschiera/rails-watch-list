Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, only: %i[index show new create update destroy edit] do
    resources :bookmarks, only: %i[new create]

  end

  resources :bookmarks, only: [:destroy, :new]

  resources :movies, only: %i[index show new create update destroy edit]



  root to: 'lists#index'
end
