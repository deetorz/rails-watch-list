Rails.application.routes.draw do
  get '/', to: 'lists#index', as: 'lists'
  resources :lists, only: %i[index new create destroy show] do
    resources :bookmarks, only: %i[new create]
  end

  resources :bookmarks, only: [:destroy]
end
