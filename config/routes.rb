Rails.application.routes.draw do
  # get 'lists', to: 'lists#index', as: 'lists'
  # get 'lists/new', to: 'lists#new', as: 'new_list'
  # post 'lists', to: 'lists#create'
  # get 'lists/:id', to: 'lists#show', as: 'list'
  resources :lists, only: [:index, :new, :create, :destroy, :show] do
    resources :bookmarks, only: [:new, :create, :destroy]
  end
end
