Rails.application.routes.draw do
  # get '/', to: 'lists#index', as: 'lists'
  root to: 'lists#index'
  resources :lists, only: %i[new create destroy show] do
    resources :bookmarks, only: %i[new create]
  end

  resources :bookmarks, only: [:destroy]
end
