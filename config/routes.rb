Rails.application.routes.draw do
  namespace :manager do
    resources :projects do
      member do
        post 'developer', to: 'projects#add_developer', as: :developers
        delete 'developer/:user_id/', to: 'projects#remove_developer', as: :developer

        post 'qa', to: 'projects#add_qa', as: :qas
        delete 'qa/:user_id/', to: 'projects#remove_qa', as: :qa
      end
    end
  end
  namespace :developer do
    resources :projects, only: %i[index show] do
      resources :change_requests, shallow: true, only: %i[show edit update] do
        member do
          post 'assign', to: 'change_requests#assign'
        end
      end
    end
  end
  namespace :quality_assurance do
    resources :projects, only: %i[index show] do
      resources :change_requests, shallow: true, only: %i[index show new create]
    end
  end
  devise_for :users
  get 'home/index'
  root 'home#index'

end
