Rails.application.routes.draw do

  namespace :manager do
    resources :projects do
      member do
        post 'developer', to: 'projects#add_developer', as: :developers
        delete 'developer/:user_id/', to: 'projects#remove_developer', as: :developer
      end
    end
  end
  namespace :developer do
    resources :projects, only: %i[index show]
  end
  namespace :quality_assurance do
    resources :projects, only: %i[index show]
  end
  devise_for :users
  get 'home/index'
  root 'home#index'

end
