Rails.application.routes.draw do
  devise_for :users
  root to: 'foods#index'
  resources :foods, only: [:new, :create, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
  end
end
