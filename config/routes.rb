Rails.application.routes.draw do

  namespace :manager do
    resources :projects
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
